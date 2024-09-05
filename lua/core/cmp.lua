local M = {}

function M.setup()
  local status, cmp = pcall(require, "cmp")
  
  if not status then
    print("Failed to load cmp")
    return
  end
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
      { name = "cmdline" },
      { name = "vsnip" },
    }
    ),
  })

end

return M
