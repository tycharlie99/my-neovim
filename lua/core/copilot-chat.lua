local M = {}

function M.setup()
    local status, chat = pcall(require, "CopilotChat")
    if not status then
        print("Error loading CopilotChat: " .. chat)
        return
    end
    chat.setup({})
end

return M
