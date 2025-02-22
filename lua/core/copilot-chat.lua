local M = {}

local prompts = {
    -- Code related prompts
    Explain = "Please explain how the following code works.",
    Review = "Please review the following code and provide suggestions for improvement.",
    Tests = "Please explain how the selected code works, then generate unit tests for it.",
    Refactor = "Please refactor the following code to improve its clarity and readability.",
    FixCode = "Please fix the following code to make it work as intended.",
    FixError = "Please explain the error in the following text and provide a solution.",
    BetterNamings = "Please provide better names for the following variables and functions.",
    Documentation = "Please provide documentation for the following code.",
    SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
    SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
    -- Text related prompts
    Summarize = "Please summarize the following text.",
    Spelling = "Please correct any grammar and spelling errors in the following text.",
    Wording = "Please improve the grammar and wording of the following text.",
    Concise = "Please rewrite the following text to make it more concise.",
}

function M.setup()
    local status, chat = pcall(require, "CopilotChat")
    if not status then
        print("Error loading CopilotChat: " .. chat)
        return
    end

    local function opts(desc)
        return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set("n", "<leader>c", ":CopilotChatToggle<CR>", opts("Toggle Copilot Chat"))
    vim.keymap.set("v", "<leader>c", ":CopilotChat<CR>", opts("Ask Copilot in Visual Mode"))

    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-",
        callback = function() vim.opt.completeopt = vim.opt.completeopt + "noinsert" + "noselect" end,
    })
    vim.api.nvim_create_autocmd("BufLeave", {
        pattern = "copilot-",
        callback = function() vim.opt.completeopt = vim.opt.completeopt - "noinsert" - "noselect" end,
    })
    chat.setup({
        question_header = " 🙋 ",
        answer_header = " 🐸 ",
        prompts = prompts,
        mappings = {
             submit_prompt = {
                normal = "<CR>",
                insert = "<C-CR>",
            },
            reset = {
                normal = "<C-q>",
                insert = "",
            }
        },
    })
end

return M
