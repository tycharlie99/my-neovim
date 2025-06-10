return {
  {
    "lewis6991/gitsigns.nvim",
    version = "^1.0.2",
    opts = {}
  },
  {
    "williamboman/mason.nvim",
    version = "^2.0.0",
    opts = {}
  },
  {
    "numToStr/Comment.nvim",
    version = "^0.8.0",
    opts = {}
  },
  {
    "windwp/nvim-autopairs",
    branch = "master",
    event = "InsertEnter",
    opts = {}
  },
  {
    "perforce.nvim",
    dir = vim.fn.stdpath("config") .. "/lua/perforce.nvim",
    config = function()
      require("perforce").setup()
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    version = "^1.0",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "^4.9.1",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        mode = "buffers",
      }
    },
  },
  {
    "cpea2506/one_monokai.nvim",
    version = "^2.5.0",
    lazy = false,
    priority = 1000,
    opts = {
      -- it will use the original terminal themes
      transparent = true,
      highlight = function(colors)
        return {
          Comment = { fg = colors.gray, italic = true },
        }
      end,
      italics = false,
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "^3.9.0",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        enabled = true,
        show_exact_scope = true,
      },
    },
  },
}
