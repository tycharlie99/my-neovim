local M = {}

local function run_p4_cmd(cmd)
    local handle = io.popen("p4 " .. cmd .. " 2>&1")
    if handle then
        local result = handle:read("*a")
        handle:close()
        return result
    end
    return "Error running p4 command"
end

function M.p4_edit()
    local file = vim.fn.expand("%")
    local output = run_p4_cmd("edit " .. file)
end

function M.p4_opened()local output = run_p4_cmd("opened")
    print(output)
end

function M.setup()
    vim.api.nvim_create_user_command("P4Edit", M.p4_edit, {})
    vim.api.nvim_create_user_command("P4Opened", M.p4_opened, {})
end

return M
