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

local function create_floating_window(content)
    local lines = type(content) == 'string' and vim.split(content, "\n") or content
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded',
    })

    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end

local function get_p4_user()
    local output = run_p4_cmd("info")
    return output:match("User name:%s*(%S+)") or "Unknown User"
end

local function handle_p4_command(cmd, show_in_floating_window)
    local file = vim.fn.expand("%")
    local output = run_p4_cmd(cmd .. " " .. file)

    if show_in_floating_window then
        create_floating_window(output)
    else
        print(output)
    end

    vim.cmd("checktime")
end

function M.p4_edit()
    handle_p4_command("edit")
end

function M.p4_opened()
    create_floating_window(run_p4_cmd("opened"))
end

function M.p4_add()
    handle_p4_command("add")
end

function M.p4_revert()
    handle_p4_command("revert")
end

function M.p4_sync()
    handle_p4_command("sync", true)
end

function M.get_resolve_files()
    handle_p4_command("resolve -n", true)
end

function M.revert_unmodified_files()
    create_floating_window(run_p4_cmd("revert -n"))
end

function M.list_user_pending_changelists()
    local user = get_p4_user()
    if user == "Unknown User" then
        print("Could not determine P4 user.")
        return
    end
    local output = run_p4_cmd("changes -u " .. user .. " -s pending")
    create_floating_window(output)
end

function M.setup()
    local commands = {
        { name = "P4Edit", func = M.p4_edit },
        { name = "P4Opened", func = M.p4_opened },
        { name = "P4Add", func = M.p4_add },
        { name = "P4Revert", func = M.p4_revert },
        { name = "P4Sync", func = M.p4_sync },
        { name = "P4ResolveFiles", func = M.get_resolve_files },
        { name = "P4RevertUnmodifiedFiles", func = M.revert_unmodified_files },
        { name = "P4ListUserPendingChangelists", func = M.list_user_pending_changelists },
    }

    for _, cmd in ipairs(commands) do
        vim.api.nvim_create_user_command(cmd.name, cmd.func, { desc = "Run " .. cmd.name })
    end

    local keymaps = {
        { key = "<leader>pe", func = M.p4_edit, desc = "P4 Edit"},
        { key = "<leader>po", func = M.p4_opened, desc = "P4 Opened" },
        { key = "<leader>pa", func = M.p4_add, desc = "P4 Add" },
        { key = "<leader>pV", func = M.p4_revert, desc = "P4 Revert" },
        { key = "<leader>ps", func = M.p4_sync, desc = "P4 Sync" },
        { key = "<leader>pr", func = M.get_resolve_files, desc = "P4 Get Resolve Files" },
        { key = "<leader>pv", func = M.revert_unmodified_files, desc = "P4 Revert Unmodified Files" },
        { key = "<leader>pc", func = M.list_user_pending_changelists, desc = "P4 List User Pending Changelists" },
    }

    for _, map in ipairs(keymaps) do
        vim.keymap.set("n", map.key, map.func, { desc = map.desc })
    end
end

return M
