local M = {}

function M.setup()
    local status, configs = pcall(require, "nvim-treesitter.configs")

    if not status then
        print("Failed to load nvim-treesitter")
        return
    end

    configs.setup({
        ensure_installed = _G.lspconfig.nvim_treesitter.ensure_installed,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        fold = {
            enable = true,
        },
    })
end

return M
