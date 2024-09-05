local M = {}

local function opts(desc)
  return { desc = "telescope: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

function M.setup()
  local status, configs = pcall(require, "nvim-treesitter.configs")
  if not status then
    print("Failed to load nvim-treesitter")
    return
  end

  configs.setup({
    ensure_installed = {
      "c",
      "lua",
      "html",
      "css",
      "javascript",
      "go",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    fold = {
      enable = true,
    },
  })
end

return M
