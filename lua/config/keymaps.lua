-- set the leader key to space
vim.g.mapleader = " "

local function opts(desc)
    return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts("nvim-tree: toggle the window"))

vim.keymap.set("n", "<leader>tk", ":tabnext<CR>", opts("tab: next"))
vim.keymap.set("n", "<leader>tj", ":tabprevious<CR>", opts("tab: previous"))
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", opts("tab: new"))
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts("tab: close"))

vim.keymap.set("n", "<M-j>", ":m .+1<CR>", opts("Line: move down"))
vim.keymap.set("n", "<M-k>", ":m .-2<CR>", opts("Line: move up"))

vim.keymap.set("n", "<leader>h", ":noh<CR>", opts("highlight: turn off"))

vim.keymap.set("n", "<leader>bv", "<C-w>v", opts("Window: Vertical split"))
vim.keymap.set("n", "<leader>bh", "<C-w>s", opts("Window: Horizontal Split"))
vim.keymap.set("n", "<leader>bx", ":close<CR>", opts("Window: Close"))

vim.keymap.set("i", "<C-j>", "<Down>", opts("Down"))
vim.keymap.set("i", "<C-k>", "<Up>", opts("Up"))
vim.keymap.set("i", "<C-h>", "<Left>", opts("Left"))
vim.keymap.set("i", "<C-l>", "<Right>", opts("Right"))
vim.keymap.set("i", "<C-d>", "<Bs>", opts("Backspace"))

vim.keymap.set("n", "<leader>/", "gcc", {remap = true})
vim.keymap.set("v", "<leader>/", "gc", {remap = true})
