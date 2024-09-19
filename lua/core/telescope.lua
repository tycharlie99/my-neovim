local M = {}

local function opts(desc)
  local bufnr = vim.api.nvim_get_current_buf()
  return { desc = "telescope: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

function M.setup()
  local status, telescope = pcall(require, "telescope")
  if not status then
    print("Failed to load telescope")
    return
  end

  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>ff", builtin.find_files, opts("teloscope: Find files"))
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts("teloscope: Find live grep"))

  telescope.setup()
end

return M
