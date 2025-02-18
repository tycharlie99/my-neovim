require("config.keymaps")
require("config.options")

_G.lspconfig = {
    lsp_lang = {
        ensure_installed = {
            "lua_ls", -- lua
            "clangd", -- c, cpp
            "pyright",
            "gopls", -- golang

            "marksman", -- markdown
            "jsonls", -- json
            "yamlls", -- yaml

            "html",
            "cssls", -- css, scss
            "ts_ls", -- typescript, javascript
        },
    },
    nvim_treesitter = {
        ensure_installed = {
            "lua",
            "c",
            "cpp",
            "python",
            "go",

            "markdown",
            "json",
            "yaml",

            "html",
            "css",
            "javascript",
            "typescript",
        },
    },
}

require("config.lazy")

local function paste()
    return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
    }
end

if vim.env.SSH_TTY ~= nil then
    vim.g.clipboard = {
        name = 'OSC 52',
        copy = {
            ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
            ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
        },
        paste = {
            -- ose52 does not support pasting, please use the terminal emulator's paste functionality
            -- ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
            -- ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
            ['+'] = paste,
            ['*'] = paste,
        },
    }
end
