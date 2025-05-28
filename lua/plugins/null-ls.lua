return {
  {
    "nvimtools/none-ls.nvim",
    branch = "main",
    dependencies = {
      "williamboman/mason.nvim",
      -- null-ls.nvim is achieved.
      -- "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          -- linters
          -- formatters
          "clang_format",
        },
        automatic_installation = true,
      })

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format.with({
            extra_args = {
              "--style=Google",
              "--length=120",
            },
          }),
        },
      })

      vim.api.nvim_set_keymap(
        "n",
        "<leader>df",
        "<cmd>lua vim.lsp.buf.format()<CR>",
        {desc = "Format code", silent = true, nowait = true }
      )
    end,
  }
}
