local M = {}

function M.setup()
  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")

  if not mason_lspconfig_status then
    vim.notify("Failed to load mason-lspconfig", vim.log.levels.ERROR)
    return
  end

  local function opts(desc)
    return {
      desc = "nvim-lspconfig: " .. desc,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  vim.keymap.set("n", "<leader>dr", vim.lsp.buf.rename, opts("Rename symbol"))
  vim.keymap.set("n", "<leader>dc", vim.lsp.buf.code_action, opts("Code action"))
  vim.keymap.set("n", "<leader>dd",
    function()
      vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
    end,
    opts("Open diagnostic float")
  )

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
    },
  })

  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",
      "clangd",
      "pyright",
      "gopls",

      "marksman",
      "jsonls",
      "yamlls",

      "html",
      "cssls",
      "ts_ls",
    },
    automatic_enable = true,
  })

  vim.lsp.config("clangd", {
    cmd = {
      "clangd",
      "--clang-tidy",
    },
  })

end

return M
