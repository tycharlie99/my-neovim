-- set the leader key to space
vim.g.mapleader = " "

local function opts(desc)
  return {
    desc = desc,
    noremap = true,
    silent = true,
    nowait = true
  }
end

vim.keymap.set("n", "zM", function()
  if vim.api.nvim_get_option_value("foldlevel", { scope = "local" }) == 0 then
    vim.opt.foldlevel = 99
  else
    vim.opt.foldlevel = 0
  end
end, opts("Toggle all folds"))

-- buffer
vim.keymap.set('n', "<leader>bj", ':bprevious<CR>', opts("Buffer: previous"))
vim.keymap.set('n', "<leader>bk", ':bnext<CR>', opts("Buffer: next"))
vim.keymap.set('n', "<leader>bc", ':bd<CR>', opts("Buffer: close"))

-- move line
vim.keymap.set("n", "<M-j>", ":m .+1<CR>", opts("Line: move down"))
vim.keymap.set("n", "<M-k>", ":m .-2<CR>", opts("Line: move up"))

-- turn off search highlight
vim.keymap.set("n", "<leader>h", ":noh<CR>", opts("Highlight: turn off"))

-- navigate cursor in insert mode
vim.keymap.set("i", "<C-j>", "<Down>", opts("Down"))
vim.keymap.set("i", "<C-k>", "<Up>", opts("Up"))
vim.keymap.set("i", "<C-h>", "<Left>", opts("Left"))
vim.keymap.set("i", "<C-l>", "<Right>", opts("Right"))
vim.keymap.set("i", "<C-d>", "<Bs>", opts("Backspace"))

-- comment
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle the comment", remap = true})
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle the comment", remap = true})

local resize_shift = 5
local resize_timeout = 500
local resize_timer = nil

local function reset_resize_timer(key)
  if resize_timer then
    resize_timer:stop()
  end

  resize_timer = vim.defer_fn(function()
    vim.api.nvim_del_keymap("n", key)
  end, resize_timeout)
end

local function has_win_below_or_above()
  local cur_win = vim.api.nvim_get_current_win()
  local cur_row = vim.api.nvim_win_get_position(cur_win)[1]
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local row = vim.api.nvim_win_get_position(win)[1]
    if row ~= cur_row then
      return true
    end
  end
  return false
end

local function resize_win(key)

  reset_resize_timer(key)

  if key == "l" then
    vim.cmd("vertical resize +" .. resize_shift)
  elseif key == "h" then
    vim.cmd("vertical resize -" .. resize_shift)
  elseif key == "j" and has_win_below_or_above() then
    vim.cmd("resize -" .. resize_shift)
  elseif key == "k" and has_win_below_or_above() then
    vim.cmd("resize +" .. resize_shift)
  end
end

local function continue_resize_win(key, desc)
  vim.keymap.set("n", "<C-w>" .. key, function()
    resize_win(key)
    vim.keymap.set("n", key, function()
      resize_win(key)
    end, { noremap = true, silent = true })
  end, opts(desc))
end

local resize_opts = {
  h = { "Resize Window: Decrease Width" },
  j = { "Resize Window: Decrease Height" },
  k = { "Resize Window: Increase Height" },
  l = { "Resize Window: Increase Width" },
}

for key, _ in pairs(resize_opts) do
  continue_resize_win(key, resize_opts[key][1])
end

vim.keymap.set("n", "<C-w>\\", ":vsplit<CR>", opts("Split Window: Vertical"))
vim.keymap.set("n", "<C-w>-", ":split<CR>", opts("Split Window: Horizontal"))

vim.keymap.set("n", "<C-w>d", function()
  local wins = vim.api.nvim_list_wins()

  -- find the first floating window
  for _, win in ipairs(wins) do
    local conf = vim.api.nvim_win_get_config(win)
    -- relative is not empty means it's a floating window
    if conf.relative ~= "" then
      vim.api.nvim_set_current_win(win)
      return
    end
  end

  vim.notify("No floating window found", vim.log.levels.WARN)
end, opts("Move to Floating Window"))

local is_maximized = false
local win_restore = {}

vim.keymap.set("n", "<C-w>m", function()
  if not is_maximized then
    win_restore = {
      height = vim.api.nvim_win_get_height(0),
      width = vim.api.nvim_win_get_width(0),
    }
    vim.cmd("wincmd _")
    vim.cmd("wincmd |")
    is_maximized = true
  else
    vim.api.nvim_win_set_height(0, win_restore.height)
    vim.api.nvim_win_set_width(0, win_restore.width)
    is_maximized = false
  end
end, opts("Toggle Maximize Window"))
