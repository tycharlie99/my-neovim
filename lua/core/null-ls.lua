local M = {}

local function opts(desc)
    return { desc = "" .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

function M.setup()
    local status, null_ls = pcall(require, "null-ls")
    if not status then
        print("Failed to load null-ls")
        return
    end

    local function get_source()
        local source = {}
        local category_map = {
            linters = "diagnostics",
            formatters = "formatting",
            code_actions = "code_actions",
        }
        for key, type in pairs(_G.lspconfig.linter) do
            local category = category_map[key]
            for linter, conf in pairs(type) do
                table.insert(source, null_ls.builtins[category][linter].with(conf))
            end
        end
        return source
    end

    vim.api.nvim_set_keymap("n", "<leader>nv", "<cmd>lua vim.lsp.buf.format()<CR>", opts("Formatter: Format code"))

    null_ls.setup({
        sources = get_source(),
    })

end

return M
