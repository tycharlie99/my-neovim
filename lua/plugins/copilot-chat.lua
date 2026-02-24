return {
  {
    "github/copilot.vim",
    version = "^1.50.0",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    version = "^4.7.4",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    event = "VimEnter",
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      vim.keymap.set("n", "<leader>c", "<cmd>CopilotChatToggle<CR>",
        { desc = "Toggle Copilot Chat", nowait = true, silent = true })
      vim.keymap.set("v", "<leader>c", "<cmd>CopilotChat<CR>",
        { desc = "Ask Copilot in Visual Mode", nowait = true, silent = true })
      vim.keymap.set("i", "<C-t>", "copilot#Accept('\\<CR>')", { expr = true, replace_keycodes = false })
      vim.g.copilot_no_tab_map = true
      -- Auto-command to customize chat buffer behavior
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-chat',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
          vim.opt_local.conceallevel = 0
        end,
      })

      require("CopilotChat").setup({
        headers = {
          user = '🙋 You',
          assistant = '🐸 Copilot',
          tool = '🔧 Tool',
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
