require("config.keymaps")
require("config.options")

local pyright_config = {
    settings = {
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    -- for pylint with pylintrc
                    reportMissingImports = "none",
                },
            },
        }
    }
}

_G.lspconfig = {
    lsp_lang = {
        lua_ls = { {}, "lua" },
        clangd = { {}, "c", "cpp" },
        pyright = { pyright_config, "python" },
        -- gopls = { {}, "go" },

        marksman = { {}, "markdown" },
        jsonls = { {}, "json" },
        yamlls = { {}, "yaml" },

        -- html = { {}, "html" },
        -- cssls = { {}, "css", "scss" },
        -- ts_ls = { {}, "typescript", "javascript" },
    },
    linter = {
        linters = {
            -- for the project's setup, please add .pylintrc file
            -- please refer to https://github.com/pylint-dev/pylint/blob/main/pylintrc
            pylint = {
                extra_args = {
                    "--max-line-length=120",
                },
            }, -- python
            cpplint = {
                args = {
                    "--linelength=120",
                    "--filter=-legal/copyright",
                    "$FILENAME"
                },
            }, -- c, cpp
        },
        formatters = {
            clang_format = {}, -- c, cpp
        },
        code_actions = {
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
