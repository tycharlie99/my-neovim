local M = {}

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
end

function M.setup()
  local status, nvim_tree = pcall(require, "nvim-tree")
  if not status then
    vim.notify("Failed to load nvim-tree", vim.log.levels.ERROR)
    return
  end

  vim.keymap.set(
    "n",
    "<leader>e",
    "<cmd>NvimTreeToggle<CR>",
    {
      desc = "nvim-tree: toggle the window",
      noremap = true,
      silent = true,
      nowait = true
    }
  )

  nvim_tree.setup({
    on_attach = on_attach,
    git = {
      ignore = false,
    },
  })
end

return M
