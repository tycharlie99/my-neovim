local M = {}

function M.setup()
    local status, configs = pcall(require, "nvim-treesitter.configs")

    if not status then
        print("Failed to load nvim-treesitter")
        return
    end
    local function get_installed_languages()
        local installed = {}
        for _, langs in pairs(_G.lspconfig.lsp_lang) do
            for _, lang in ipairs(langs) do
                table.insert(installed, lang)
            end
        end
        return installed
    end

    configs.setup({
        ensure_installed = get_installed_languages(),
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
