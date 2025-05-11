local M = {}

function M.setup()
  local status, color = pcall(require, "one_monokai")
  if not status then
    vim.notify("Failed to load one_monokai", vim.log.levels.ERROR)
  end

  color.setup({
    -- it will use the original terminal themes
    transparent = true,
    colors = {},
    highlight = function(colors)
      return {
        Comment = { fg = colors.gray, italic = true },
      }
    end,
    italics = false,
  })
end

return M
