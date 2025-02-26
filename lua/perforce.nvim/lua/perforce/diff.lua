local M = {}

local ns = vim.api.nvim_create_namespace("p4_diff")

vim.api.nvim_set_hl(0, "P4DiffDeleteHL", { fg = "#fb4934" })
vim.fn.sign_define("P4DiffDelete", { text = "_", texthl = "P4DiffDeleteHL" })

vim.api.nvim_set_hl(0, "P4DiffChangeHL", { fg = "#2933f2", bold = true }) -- 背景深灰，前景黃色
vim.fn.sign_define("P4DiffChange", { text = "┃", texthl = "P4DiffChangeHL" })

vim.api.nvim_set_hl(0, "P4DiffAddHL", { fg = "#17d161", bold = true }) -- 背景深灰，前景黃色
vim.fn.sign_define("P4DiffAdd", { text = "┃", texthl = "P4DiffAddHL" })


local function get_p4_diff(diff_output)
    local changes = {}
    local new_start = nil
    local last_deleted = nil

    for line in diff_output:gmatch("[^\r\n]+") do
        local match_start = line:match("^@@ %-%d+,%d+ %+(%d+),?%d* @@")
        if match_start then
            new_start = tonumber(match_start)
            last_deleted = nil
        end

        if new_start then
            if line:match("^%+") then
                if last_deleted then
                    table.insert(changes, { type = "modify", line = last_deleted })
                    last_deleted = nil
                else
                    table.insert(changes, { type = "add", line = new_start })
                end
                new_start = new_start + 1
            elseif line:match("^%-") then
                table.insert(changes, { type = "delete", line = new_start })
                last_deleted = new_start
            elseif line:match("^ ") then
                new_start = new_start + 1
                last_deleted = nil
            end
        end
    end
    return changes
end

local function update_signs(diff_output)
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    local changes = get_p4_diff(diff_output)

    for _, change in ipairs(changes) do
        local sign = "P4DiffChange"
        if change.type == "add" then
            sign = "P4DiffAdd"
        elseif change.type == "modify" then
            sign = "P4DiffChange"
        elseif change.type == "delete" then
            sign = "P4DiffDelete"
        end
        vim.fn.sign_place(0, "p4_diff", sign, "%", { lnum = change.line, priority = 100 })
    end
end

local function async_p4_diff()
    local file = vim.fn.expand("%")
    local stdout = vim.loop.new_pipe(false)
    local handle

    handle = vim.loop.spawn("p4", {
        args = { "diff", "-du", file },
        stdio = { nil, stdout, nil },
    }, function()
        stdout:close()
        handle:close()
    end)

    stdout:read_start(function(err, data)
        if err then
            print("Error running p4 diff:", err)
            return
        end
        if data then
            vim.schedule(function()
                update_signs(data)
            end)
        end
    end)
end


local debounce_timer = nil
local function debounce(func, delay)
    return function(...)
        local args = { ... }

        if debounce_timer then
            vim.loop.timer_stop(debounce_timer)
        end
        debounce_timer = vim.loop.new_timer()
        debounce_timer:start(delay, 0, vim.schedule_wrap(function()
            func(unpack(args))
        end))
    end
end

M.setup = function()
    async_p4_diff()
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = debounce(async_p4_diff, 100),
    })
end

return M
