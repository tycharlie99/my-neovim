return {
  {
    "nvim-telescope/telescope.nvim",
    -- branch = "0.1.x",
    version = "^0.2.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files",     silent = true, nowait = true },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Find live grep", silent = true, nowait = true },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find buffers",   silent = true, nowait = true },
      {
        "<leader>fd",
        function()
          require('telescope.builtin').diagnostics({bufnr = 0})
        end,
        desc = "Buffer Diagnostics",
        silent = true,
        nowait = true,
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "%.git/",
          ".DS_Store",
          ".cache",
          ".venv"
        },
      },
      -- If the system can't install `ripgrep`
      -- please uncomment the following setting for using grep
      --
      -- defaults = {
      --   vimgrep_arguments = {
      --     "grep",
      --     "--extended-regexp",
      --     "--color=never",
      --     "--with-filename",
      --     "--line-number",
      --     "-b",
      --     "--recursive",
      --     "--no-messages",
      --     "--exclude-dir=*cache*",
      --     "--exclude-dir=*.git",
      --     "--binary-files=without-match",
      --   },
      -- },
    },
  },
}
