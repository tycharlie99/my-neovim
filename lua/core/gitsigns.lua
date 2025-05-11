local M = {}

function M.setup()
  local status, gitsigns = pcall(require, "gitsigns")
  if not status then
    vim.notify("Failed to load gitsigns", vim.log.levels.ERROR)
    return
  end

  gitsigns.setup()

end

return M
