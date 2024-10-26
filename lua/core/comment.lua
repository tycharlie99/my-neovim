local M = {}

function M.setup()
    local status, Comment = pcall(require, "Comment")
    if not status then
        print("Failed to load Comment")
        return
    end

    Comment.setup()

end

return M
