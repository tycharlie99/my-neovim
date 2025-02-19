local M = {}

local function opts(desc)
    return { desc = "telescope: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

function M.setup()
    local status, telescope = pcall(require, "telescope")
    if not status then
        print("Failed to load telescope")
        return
    end

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, opts("teloscope: Find files"))
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts("teloscope: Find live grep"))
    vim.keymap.set("n", "<leader>fb", builtin.buffers, opts("teloscope: Find buffers"))
    telescope.setup({
        -- 
        -- If the system can't install `ripgrep`, please uncomment the following setting for using grep
        --
        -- defaults = {
        --     vimgrep_arguments = {
        --         "grep",
        --         "--extended-regexp",
        --         "--color=never",
        --         "--with-filename",
        --         "--line-number",
        --         "-b",
        --         "--recursive",
        --         "--no-messages",
        --         "--exclude-dir=*cache*",
        --         "--exclude-dir=*.git",
        --         "--binary-files=without-match",
        --     },
        -- },
    })
end

return M
