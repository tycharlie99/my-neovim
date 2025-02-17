local M = {}

function M.setup()
    local status, lspconfig = pcall(require, "lspconfig")

    if not status then
        print("Failed to load lspconfig")
        return
    end

    local function opts(desc)
        return { desc = "nvim-lspconfig: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
    vim.keymap.set("n", "<leader>d",
        function()
            vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
        end,
        opts("Open diagnostic float"))

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
            border = "rounded",
        },
    })

    lspconfig.lua_ls.setup({})
    lspconfig.clangd.setup({})
    lspconfig.pyright.setup({})
    lspconfig.gopls.setup({})

    lspconfig.marksman.setup({})
    lspconfig.jsonls.setup({})
    lspconfig.yamlls.setup({})

    lspconfig.html.setup({})
    lspconfig.cssls.setup({})
    lspconfig.ts_ls.setup({})
 
end

return M
