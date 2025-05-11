local M = {}

function M.setup()
  local status, bufferline = pcall(require, "bufferline")
  if not status then
    vim.notify("Failed to load bufferline", vim.log.levels.ERROR)
  end

  bufferline.setup({
    options = {
      mode = "buffers",
    }
  })
end

return M
