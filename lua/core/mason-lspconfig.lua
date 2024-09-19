local M = {}

function M.setup()
  local status, lspconfig = pcall(require, "mason-lspconfig")

  if not status then
    print("Failed to load mason-lspconfig")
    return
  end
  lspconfig.setup({
    ensure_installed = {
      "lua_ls", -- lua
      "clangd", -- c, cpp
      "tsserver", -- typescript, javascript
      "marksman", -- markdown
      "cssls", -- css, scss
      "html",
      "gopls", -- golang
      "jsonls", -- json
    },
  })
end

return M
