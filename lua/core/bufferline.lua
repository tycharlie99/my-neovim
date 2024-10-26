local M = {}

function M.setup()
    local status, bufferline = pcall(require, "bufferline")
    if not status then
        print("Fialed to load bufferline")
    end

    bufferline.setup({
        options = {
            mode = "tabs",
        }
    })
end

return M
