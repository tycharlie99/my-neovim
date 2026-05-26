return {
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {}, -- tree-sitter CLI must be installed system-wide
    config = function()
      require("tree-sitter-manager").setup({
        -- ensure_installed = { "bash", "lua", "python" }, -- list of parsers to install automatically
        -- Optional: custom paths
        -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
        -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
      })
    end
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   event = { "BufReadPost", "BufNewFile" },
  --   main = "nvim-treesitter.configs",
  --   opts = {
  --     ensure_installed = {
  --       "bash",
  --       "c",
  --       "cpp",
  --       "go",
  --       "lua",
  --       "python",
  --
  --       "html",
  --       "javascript",
  --       "css",
  --
  --       "markdown",
  --       "markdown_inline",
  --       "json",
  --       "yaml",
  --     },
  --     auto_install = true,
  --     highlight = {
  --       enable = true,
  --     },
  --     indent = {
  --       enable = true,
  --     },
  --     fold = {
  --       enable = true,
  --     },
  --   },
  -- },
}
