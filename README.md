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

### Language Config Server config (lspconfig)

- `gd`: Go to definition
- `gD`: Go to declaration

### Window

- `<leader>bv`: Split window vertical
- `<leader>bh`: Split window horizontal

### Tab

- `<leader>tj`: Previous tab
- `<leader>tk`: Next tab
- `<leader>tb`: New tab
- `<leader>tx`: Close tab

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

- `zR`: Open all folds
- `zM`: Close all folds
