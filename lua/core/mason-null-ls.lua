local M = {}



function M.setup()
    local status, mason_null_ls = pcall(require, "mason-null-ls")
    if not status then
        print("Failed to load mason-null-ls")
        return
    end

    local function get_installed_linters()
        local installed = {}
        for _, type in pairs(_G.lspconfig.linter) do
            for _, linter in ipairs(type) do
                table.insert(installed, linter)
            end
        end
        return installed
    end

    mason_null_ls.setup({
        ensure_installed = get_installed_linters(),
    })

end

return M
