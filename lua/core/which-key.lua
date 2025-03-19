local M = {}

function M.setup()
    local status, wk = pcall(require, "which-key")

    if not status then
        print("Failed to load which key")
        return
    end
    local opts = {
        { "<leader>t", group = "Tab" },
        { "<leader>f", group = "Telescope" },
        { "<leader>b", group = "Buffer" },
        { "<leader>d", group = "Lsp" },
        { "<leader>n", group = "Formatter" },

        { "za", desc = "Toggle fold under the cursor" },
        { "zo", desc = "Open fold under the cursor" },
        { "zO", desc = "Open all fold under the cursor" },
        { "zc", desc = "Close fold under the cursor" },
        { "zC", desc = "Close all fold under the cursor" },

        { "g'", hidden = true },
        { "g`", hidden = true },
        { "gb", hidden = true },
        { "gc", hidden = true },
    }

    for _, shortcut in ipairs(_G.window_disable) do
        table.insert(opts, { shortcut, hidden = true})
    end

    wk.add(opts)
    wk.setup({
        triggers = {
            -- { "<auto>", mode = "nxso" },
            { "<leader>" },
            { "<C-w>" },
            { "g" },
            { "z" },
        },
        icons = {
            mappings = false, -- shows the icon for each mappings
        },
        plugins = {
            registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            },
            presets = {
                operators = false, -- adds help for operators like d, y, ...
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = false, -- misc bindings to work with windows
                z = false, -- bindings for folds, spelling and others prefixed with z
                g = false, -- bindings for prefixed with g
            },
        },
    })
end

return M
