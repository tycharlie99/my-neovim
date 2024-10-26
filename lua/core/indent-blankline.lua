local M = {}

function M.setup()
    local status, ibl = pcall(require, "ibl")
    if not status then
        print("Failed to load indent-blankline")
        return
    end
    local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    end)

    ibl.setup({
        indent = {
            highlight = highlight,
        },
        scope = {
            enabled = true,
            show_exact_scope = true,
        }
    })
end

return M
