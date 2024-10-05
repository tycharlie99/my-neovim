local M = {}

function M.setup()
  local status, color = pcall(require, "one_monokai")
  if not status then
    print("Failed to load one_monokai")
  end

  color.setup({
    transparent = false,
    themes = function()
      return {}
    end,
    italics = true,
  })
end

return M
