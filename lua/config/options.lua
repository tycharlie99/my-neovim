-- disable the swap file
vim.opt.swapfile = false

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- conceal text
vim.opt.conceallevel = 0

-- default indentation
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- list characters
vim.opt.list = true
vim.opt.listchars = {
  eol = "↴",
  trail = "·",
  tab = ">-",
  space = "·",
}

local function set_listchars(use_spaces)
  local listchars = {
    eol = "↴",
  }

  if use_spaces then
    listchars.trail = "·"
    listchars.tab = ">-"
  else
    listchars.tab = "  "
    listchars.space = "·"
  end

  vim.opt_local.listchars = listchars
end

-- filetype-specific indentation rules
local function apply_indent(width, use_spaces)
  vim.opt_local.expandtab = use_spaces
  vim.opt_local.tabstop = width
  vim.opt_local.shiftwidth = width
  vim.opt_local.softtabstop = width
  set_listchars(use_spaces)
end

local filetype_indents = {
  c = { width = 2, use_spaces = true },
  cpp = { width = 2, use_spaces = true },
  lua = { width = 2, use_spaces = true },
  make = { width = 4, use_spaces = false },
  go = { width = 4, use_spaces = false },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(filetype_indents),
  callback = function()
    local config = filetype_indents[vim.bo.filetype]
    if not config then
      return
    end

    apply_indent(config.width, config.use_spaces)
  end,
})

-- general editing behavior
-- line wrapping
vim.opt.wrap = true

-- search setting
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true

-- backspace behavior
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- set updatetime
vim.opt.updatetime = 300

-- folding
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 5

-- completion menu
vim.opt.completeopt = { "menu", "preview", "menuone", "noinsert", "popup", "noselect" }
