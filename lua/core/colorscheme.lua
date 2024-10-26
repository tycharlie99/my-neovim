local M = {}

function M.setup()
    local status, color = pcall(require, "one_monokai")
    if not status then
        print("Failed to load one_monokai")
    end

    color.setup({
        -- it will use the original terminal themes
        transparent = true,
        colors = {},
        themes = function(colors)
            return {
                Comment = { fg = colors.gray, italic = true },
            }
        end,
        italics = false,
    })
end

return M
