local M = {}

function M.setup()
    local status, lspconfig = pcall(require, "mason-lspconfig")

    if not status then
        print("Failed to load mason-lspconfig")
        return
    end

    local function get_installed_languages()
        local installed = {}
        for lsp, _ in pairs(_G.lspconfig.lsp_lang.ensure_installed) do
            table.insert(installed, lsp)
        end
        return installed
    end

    lspconfig.setup({
        ensure_installed = get_installed_languages()
    })
end

return M
