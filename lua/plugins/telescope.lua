return {
  {
    "nvim-telescope/telescope.nvim",
    version = "^0.2.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "%.git/",
            ".DS_Store",
            ".cache",
            ".venv",
          },
        },
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
        },
      })

      require("telescope").load_extension("ui-select")
    end,
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
  },
}
