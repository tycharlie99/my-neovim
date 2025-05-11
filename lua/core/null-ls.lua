local M = {}

function M.setup()
  local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
  local null_ls_status, null_ls = pcall(require, "null-ls")

  if not mason_null_ls_status then
    vim.notify("Failed to load mason-null-ls", vim.log.levels.ERROR)
    return
  end

  if not null_ls_status then
    vim.notify("Failed to load null-ls", vim.log.levels.ERROR)
    return
  end

  mason_null_ls.setup({
    ensure_installed = {
      -- linters
      "pylint",
      -- formatters
      "clang_format",
    },
    automatic_installation = true,
  })

  ---@diagnostic disable-next-line: redundant-parameter
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

  local function opts(desc)
    return {
      desc = "" .. desc,
      noremap = true, silent = true, nowait = true }
  end

  vim.api.nvim_set_keymap(
    "n",
    "<leader>nv",
    "<cmd>lua vim.lsp.buf.format()<CR>",
    opts("Formatter: Format code")
  )
end

return M
