return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    event = "VimEnter",
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function ()

      vim.keymap.set("n", "<leader>c", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat", nowait = true, silent = true })
      vim.keymap.set("v", "<leader>c", "<cmd>CopilotChat<CR>", { desc = "Ask Copilot in Visual Mode", nowait = true, silent = true })
      vim.keymap.set("i", "<C-t>", "copilot#Accept('\\<CR>')", { expr = true, replace_keycodes = false })
      vim.g.copilot_no_tab_map = true

      require("CopilotChat").setup({
        question_header = " 🙋 ",
        answer_header = " 🐸 ",
        prompts = {
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
        },
        mappings = {
          submit_prompt = {
            normal = "<CR>",
            insert = "<C-\\>",
          },
          reset = {
            normal = "<C-q>",
            insert = "",
          }
        },
      })
    end,
  },
}