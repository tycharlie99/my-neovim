local M = {}

function M.setup()
  local status, configs = pcall(require, "nvim-treesitter.configs")

  if not status then
    vim.notify("Failed to load nvim-treesitter", vim.log.levels.ERROR)
    return
  end

  configs.setup({
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "go",
      "lua",
      "python",

      "html",
      "javascript",
      "css",

      "markdown",
      "markdown_inline",
      "json",
      "yaml",
    },
    auto_install = true,
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
