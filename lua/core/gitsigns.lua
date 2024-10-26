local M = {}

function M.setup()
    local status, gitsigns = pcall(require, "gitsigns")
    if not status then
        print("Failed to load gitsigns")
        return
    end

    gitsigns.setup()

end

return M
