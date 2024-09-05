local M = {}

function M.setup()
  require'lspconfig'.pyright.setup{}
  local status, lspconfig = pcall(require, "lspconfig")
  if not status then
    print("Failed to load lspconfig")
    return
  end

  lspconfig.lua_ls.setup({
    log_level = 1,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  })

end

return M
