local M = {}

function M.setup()
  local status, mason = pcall(require, "mason")

  if not status then
    vim.notify("Failed to load mason", vim.log.levels.ERROR)
    return
  end

  mason.setup {}
end

return M
