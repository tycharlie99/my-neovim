# My Neovim

The configuration of my neovim.

## Pre-request

- Neovim v0.10+
    - Ubuntu need build from source
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) for `live_grep` in [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Mason
    - `gcc` or `clang` for C/C++
    - `npm` for most lsp
    - `go` for go lang lsp
    - `luarocks` for lua

### Windows

Run in wsl. For yank to clipboard need [win32yank](https://github.com/equalsraf/win32yank)

## Shortcut

- `<leader>`: whitespace key

### Copilot Chat

- `<leader>c`: Open the copilot chat
- In copilot-chat window
    - Normal mode: <tab> for enter
    - Insert mode: <C-CR> for enter

### Comment

- `<leader>/`: Toggle comment

> The comment key works in normal mode and visual mode.

### Language Config Server config (lspconfig)

- `gd`: Go to definition
- `gD`: Go to declaration
- `<leader>dr`: Rename
- `<leader>dc`: Code action
- `<leader>dd`: Show diagnostic

### Window

- `<C-w>\`: Split window vertical
- `<C-w>-`: Split window horizontal
- `<C-w>q`: Close window
- `<C-w>h`: Decrease window width
- `<C-w>l`: Increase window width
- `<C-w>j`: Decrease window height
- `<C-w>k`: Increase window height
- `<C-w>T`: Move window to new tab
- `<C-w>m`: Toggle window maximize
- `<C-w>=`: Balance window size
- `<C-w>d`: Navagate to the floating window

### Tab

- `<leader>tj`: Previous tab
- `<leader>tk`: Next tab
- `<leader>tb`: New tab
- `<leader>tc`: Close tab

### Nvim Tree

- `<leader>e`: Toggle the nvim tree
- `C`: Change the root folder
- `v`: Open in vertical split
- `h`: Open in horizontal split
- `t`: Open in new tab

### Telescope

- `<leader>ff`: Find files
- `<leader>fg`: Find live frep (text)
- `<leader>fb`: Find buffers

### Folding

- `za`: Toggle the fold under the cursor

- `zo`: Open the fold under the cursor
- `zO`: Open the all folds under the cursor

- `zc`: Close the fold under the cursor
- `zC`: Close the all folds under the cursor

- `zM`: Toggle all folds
