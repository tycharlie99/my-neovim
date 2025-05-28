return {
  {
    "folke/which-key.nvim",
    version = "^3.17.0",
    event = "VeryLazy",
    opts = {
      triggers = {
        -- { "<auto>", mode = "nxso" },
        { "<leader>" },
        { "<C-w>" },
        { "g" },
        { "z" },
      },
      icons = {
        mappings = false, -- shows the icon for each mappings
      },
      plugins = {
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        },
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = false, -- misc bindings to work with windows
          z = false, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
        },
      },
      spec = {
        { "<leader>f", group = "Telescope" },
        { "<leader>b", group = "Buffer" },
        { "<leader>d", group = "Lsp" },
        { "<leader>n", group = "Formatter" },
        { "<leader>p", group = "Perforce" },

        { "za", desc = "Toggle fold under the cursor" },
        { "zo", desc = "Open fold under the cursor" },
        { "zO", desc = "Open all fold under the cursor" },
        { "zc", desc = "Close fold under the cursor" },
        { "zC", desc = "Close all fold under the cursor" },

        { "g'", hidden = true },
        { "g`", hidden = true },
        { "gb", hidden = true },
        { "gc", hidden = true },

        { "<C-w>H", hidden = true },
        { "<C-w>J", hidden = true },
        { "<C-w>K", hidden = true },
        { "<C-w>L", hidden = true },
        { "<C-w>s", hidden = true },
        { "<C-w>v", hidden = true },
        { "<C-w>o", hidden = true },
        { "<C-w>w", hidden = true },
        { "<C-w>x", hidden = true },
        { "<C-w>+", hidden = true },
        { "<C-w><", hidden = true },
        { "<C-w>>", hidden = true },
        { "<C-w>_", hidden = true },
        { "<C-w>|", hidden = true },
        { "<C-w><C-d>", hidden = true },
      },
    },
  },
}
