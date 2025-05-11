-- disable the swap file
vim.opt.swapfile = false
-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- set for hidden the text or not
vim.opt.conceallevel = 0

-- tabs & indentation for default
-- change the tab (\t) show as width to length of 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
-- set the length inserted for each indentation
vim.opt.softtabstop = 4
-- affect the behavior of the << and >> commands
vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "c",
    "cpp",
    "lua",
  },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "make",
    "go",
  },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- line wrapping
vim.opt.wrap = true

-- search setting
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true

-- backsapce
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- split window
vim.opt.splitright = true
vim.opt.splitbelow = true

-- set updatetime
vim.opt.updatetime = 300

-- set list
vim.opt.list = true


vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local listchars = {
      eol = "↴",
    }

    if vim.bo.expandtab then
      listchars.trail = "·"
      listchars.tab = ">-"
    else
      listchars.tab = "  "
      listchars.space = "·"
    end

    vim.opt.listchars = listchars
  end,
})


vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- TODO: some error need to be fix
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.foldlevel = 5

vim.opt.completeopt = { "menu", "preview", "menuone", "noinsert", "popup", "noselect" }
