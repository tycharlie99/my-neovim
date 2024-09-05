local M = {}

function M.setup()
  local status, mason = pcall(require, "mason")
  
  if not status then
    print("Failed to load mason")
    return
  end

  mason.setup {}
end

return M
