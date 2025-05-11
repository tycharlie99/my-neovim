return {
    {
        "mhinz/vim-signify",
        config = function()
            local function is_perforce()
                local ok, output = pcall(vim.fn.system, "p4 info")
                if not ok then
                    return false
                end

                local root = output:match("Client root: ([^\n]+)")

                if root then
                    local current_dir = vim.fn.getcwd()
                    if current_dir:find(root, 1, true) then
                        return true
                    end
                end
                return false
            end
            if is_perforce() then
                require("core.signify").setup()
            else
                vim.g.signify_disable_by_default = 1
            end
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("core.gitsigns").setup()
        end,
    },
    {
        "perforce.nvim",
        dir = vim.fn.stdpath("config") .. "/lua/perforce.nvim",
        config = function()
            require("perforce").setup()
        end
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-null-ls.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "neovim/nvim-lspconfig",
            -- null-ls.nvim is achieved.
            -- "jose-elias-alvarez/null-ls.nvim",
            "nvimtools/none-ls.nvim",
            "nvim-lua/plenary.nvim", -- dependency for null-ls
        },
        config = function()
            require("core.mason").setup()
            require("core.nvim-lspconfig").setup()
            require("core.null-ls").setup()
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        config = function ()
            require("core.copilot-chat").setup()
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function ()
            require("core.which-key").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function ()
            require("core.bufferline").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("core.comment").setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            -- for vsnip
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = function()
            require("core.nvim-cmp").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {},
    },
    {
        "cpea2506/one_monokai.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("core.colorscheme").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("core.nvim-tree").setup()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("core.lualine").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("core.telescope").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("core.indent-blankline").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("core.nvim-treesitter").setup()
        end,
    },
}
