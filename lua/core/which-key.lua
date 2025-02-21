local M = {}

function M.setup()
    local status, wk = pcall(require, "which-key")

    if not status then
        print("Failed to load which key")
        return
    end
    local opts = {
        { "<leader>t", group = "Tab" },
        { "<leader>c", group = "Copilot-Chat" },
        { "<leader>f", group = "Telescope" },
        { "<leader>b", group = "Buffer" }
    }
    for _, shortcut in ipairs(_G.window_disable) do
        table.insert(opts, { shortcut, hidden = true})
    end
    wk.add(opts)
end

return M
