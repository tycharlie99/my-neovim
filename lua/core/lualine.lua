local M = {}

function M.setup()
  local status, lualine = pcall(require, "lualine")
  if not status then
    print("Failed to load lualine")
    return
  end

  lualine.setup()

end

return M
