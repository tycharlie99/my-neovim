local M = {}

function M.setup()
  local status, Comment = pcall(require, "Comment")
  if not status then
    vim.notify("Failed to load Comment", vim.log.levels.ERROR)
    return
  end

  Comment.setup()
end

return M
