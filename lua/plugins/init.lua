return {
  { "lewis6991/gitsigns.nvim", opts = {} },
  { "williamboman/mason.nvim", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  {
    "perforce.nvim",
    dir = vim.fn.stdpath("config") .. "/lua/perforce.nvim",
    config = function()
      require("perforce").setup()
    end
  },
  {
    "christoomey/vim-tmux-navigator",
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
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode = "buffers",
      }
    },
  },
  {
    "cpea2506/one_monokai.nvim",
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