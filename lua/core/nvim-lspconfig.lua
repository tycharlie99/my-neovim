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

    lspconfig.pyright.setup({
        cmd = {
            "pyright-langserver",
            "--stdio",
        },
        filetypes = {
            "python",
        },
        single_file_support = true,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true,
                },
            },
        },
    })

    lspconfig.jsonls.setup({
        cmd = {
            "vscode-json-language-server",
            "--stdio",
        },
        filetypes    = {
            "json",
            "jsonc",
        },
        init_options = {
            provideFormatter = true,
        },
        root_dir = lspconfig.util.find_git_ancestor,
        single_file_support = true,
    })

    lspconfig.lua_ls.setup({
        cmd = {
            "lua-language-server",
        },
        filetypes = {
            "lua",
        },
        log_level = 1,
        root_dir = lspconfig.util.root_pattern(
            ".luarc.json",
            ".luarc.jsonc",
            ".luacheckrc",
            ".stylua.toml",
            "stylua.toml",
            "selene.toml",
            "selene.yml",
            ".git"
        ),
        single_file_support = true,
        settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        "vim",
                        "bufnr",
                    },
                },
            },
        },
    })

    lspconfig.clangd.setup({
        cmd = {
            "clangd",
        },
        filetypes = {
            "c",
            "cpp",
            "objc",
            "objcpp",
            "cuda",
            "proto",
        },
        root_dir = lspconfig.util.root_pattern(
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac",
            ".git"
        ),
        single_file_support = true,
    })

    lspconfig.ts_ls.setup({
        cmd = {
            "typescript-language-server",
            "--stdio",
        },
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
        init_options = {
            hostInfo = "neovim",
        },
        root_dir = lspconfig.util.root_pattern(
            "tsconfig.json",
            "jsconfig.json",
            "package.json",
            ".git"
        ),
        single_file_support = true,
    })

    lspconfig.marksman.setup({
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                vim.opt_local.shiftwidth = 4
                vim.opt_local.tabstop = 4
                vim.opt_local.expandtab = true
            end,
        }),
        cmd = {
            "marksman",
            "server",
        },
        filetypes = {
            "markdown",
            "markdown.mdx",
        },
        root_dir = lspconfig.util.root_pattern(
            ".git",
                "marksman.toml"
        ),
        single_file_support = true,
    })

    lspconfig.cssls.setup({
        cmd = {
            "vscode-css-language-server",
            "--stdio",
        },
        filetypes = {
            "css",
            "scss",
            "less",
        },
        init_options = {
            provideFormatter = true,
        },
        root_dir = lspconfig.util.root_pattern(
            "package.json",
            ".git"
        ),
        settings = {
            css = {
                validate = true,
            },
            less = {
                validate = true,
            },
            scss = {
                validate = true,
            }
        },
        single_file_support = true,
    })

    lspconfig.html.setup({
        cmd = {
            "vscode-html-language-server",
            "--stdio",
        },
        filetypes = {
            "html",
            "templ",
        },
        init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
                css = true,
                javascript = true,
            },
            provideFormatter = true,
        },
        single_file_support = true,
    })

    lspconfig.gopls.setup({
        cmd = {
            "gopls",
        },
        filetypes = {
            "go",
            "gomod",
            "gowork",
            "gotmpl",
        },
        root_dir = lspconfig.util.root_pattern(
            "go.work",
            "go.mod",
            ".git"
        ),
        single_file_support = true,
    })
end

return M
