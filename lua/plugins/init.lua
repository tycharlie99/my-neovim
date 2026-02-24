return {
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },
  {
    "j-hui/fidget.nvim",
    version = "^1.6.1",
    opts = {
      notification = {
        window = {
          winblend = 0,
        }
      }
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    version = "^2.0.0",
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
    "christoomey/vim-tmux-navigator",
    -- version = "^1.0",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
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
