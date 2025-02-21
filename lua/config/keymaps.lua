-- set the leader key to space
vim.g.mapleader = " "

local function opts(desc)
    return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts("nvim-tree: toggle the window"))


vim.keymap.set('n', "<leader>bp", ':bprevious<CR>', opts("buffer: previous"))
vim.keymap.set('n', "<leader>bn", ':bnext<CR>', opts("buffer: next"))
vim.keymap.set('n', "<leader>bc", ':bd<CR>', opts("buffer: close"))


vim.keymap.set("n", "<leader>tk", ":tabnext<CR>", opts("tab: next"))
vim.keymap.set("n", "<leader>tj", ":tabprevious<CR>", opts("tab: previous"))
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", opts("tab: new"))
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts("tab: close"))

vim.keymap.set("n", "<M-j>", ":m .+1<CR>", opts("Line: move down"))
vim.keymap.set("n", "<M-k>", ":m .-2<CR>", opts("Line: move up"))

vim.keymap.set("n", "<leader>h", ":noh<CR>", opts("highlight: turn off"))

vim.keymap.set("i", "<C-j>", "<Down>", opts("Down"))
vim.keymap.set("i", "<C-k>", "<Up>", opts("Up"))
vim.keymap.set("i", "<C-h>", "<Left>", opts("Left"))
vim.keymap.set("i", "<C-l>", "<Right>", opts("Right"))
vim.keymap.set("i", "<C-d>", "<Bs>", opts("Backspace"))

vim.keymap.set("n", "<leader>/", "gcc", {remap = true})
vim.keymap.set("v", "<leader>/", "gc", {remap = true})

local resize_shift = 5
local resize_timerout = 500
local resize_timer = nil

local function reset_resize_timer(key)
    if resize_timer then
        resize_timer:stop()
    end

    resize_timer = vim.defer_fn(function()
        vim.api.nvim_del_keymap("n", key)
    end, resize_timerout)
end

local function resize_win(key)
    reset_resize_timer(key)
    if key == "l" then
        vim.cmd("vertical resize +" .. resize_shift)
    elseif key == "h" then
        vim.cmd("vertical resize -" .. resize_shift)
    elseif key == "j" then
        vim.cmd("resize -" .. resize_shift)
    elseif key == "k" then
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

vim.keymap.set("n", "<C-w>-", ":split<CR>", opts("Split Window: Horizontal"))
vim.keymap.set("n", "<C-w>\\", ":vsplit<CR>", opts("Split Window: Vertical"))

_G.window_disable = {
    "<C-w>H",
    "<C-w>J",
    "<C-w>K",
    "<C-w>L",
    "<C-w>s",
    "<C-w>v",
    "<C-w>o",
    "<C-w>w",
    "<C-w>x",
    "<C-w>+",
    "<C-w><",
    "<C-w>>",
    "<C-w>_",
    "<C-w><C-d>",
}

for _, shortcut in ipairs(_G.window_disable) do
    vim.keymap.set("n", shortcut, "<Nop>", { noremap = true, silent = true })
end

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

vim.keymap.set("n", "<leader>z", function()
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
