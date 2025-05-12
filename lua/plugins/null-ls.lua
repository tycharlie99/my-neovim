return {
  {
    "nvimtools/none-ls.nvim",
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
          -- "pylint",
          -- formatters
          "clang_format",
        },
        automatic_installation = true,
      })

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- please refer to https://github.com/pylint-dev/pylint/blob/main/pylintrc
          -- null_ls.builtins.diagnostics.pylint.with({
          --   extra_args = {
          --     "--max-line-length=120",
          --     "--disable=missing-docstring",
          --     "--disable=missing-function-docstring",
          --     "--disable=invalid-name",
          --   },
          -- }),
          null_ls.builtins.formatting.clang_format,
        },
      })

      vim.api.nvim_set_keymap(
        "n",
        "<leader>nv",
        "<cmd>lua vim.lsp.buf.format()<CR>",
        {desc = "Formatter: Format code", silent = true, nowait = true }
      )
    end,
  }
}
