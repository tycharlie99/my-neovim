local M = {}

function M.setup()
    local status, lspconfig = pcall(require, "mason-lspconfig")

    if not status then
        print("Failed to load mason-lspconfig")
        return
    end
    lspconfig.setup({
        ensure_installed = _G.lspconfig.lsp_lang.ensure_installed,
    })
end

return M
