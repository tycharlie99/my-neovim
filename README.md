# My Neovim

The configuration of my neovim.

## Pre-request

- Neovim v0.11+
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) for `live_grep` in [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [mason.nvim](https://github.com/mason-org/mason.nvim) needs some language packages. Please use `:checkhealth mason` to get a full list.

### Windows

Run in wsl. For yank to clipboard need [win32yank](https://github.com/equalsraf/win32yank)

## Keymap and Shortcut

The keymap and shortcut have the hint by [which-key.nvim](https://github.com/folke/which-key.nvim). The following is the most commonly used.

- `<leader>`: whitespace key

### Copilot Chat

- `<leader>c`: Open the copilot chat
- In copilot-chat window
    - Normal mode: `<CR>` for enter
    - Insert mode: `<C-\>` for enter

### Comment

- `<leader>/`: Toggle comment

> The comment key works in normal mode and visual mode.

### Language Config Server

- `gd`: Go to definition
- `gD`: Go to declaration
- `<leader>dr`: Rename
- `<leader>dc`: Code action
- `<leader>dd`: Show diagnostic
- `<leader>df`: Format document

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

### Buffer

- `<leader>bj`: Previous tab
- `<leader>bk`: Next tab
- `<leader>bb`: New tab
- `<leader>bc`: Close tab

### Nvim Tree

- `<leader>e`: Toggle the nvim tree
- `C`: Change the root folder
- `v`: Open in vertical split
- `h`: Open in horizontal split

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

## License

This project is licensed under the MIT License.
The license is effective retroactively, applying to all source code, documentation, and related materials created from the project's inception in 2024 up to the present date.
By using or distributing this software, you agree to be bound by the terms of this license throughout the entire period of development and maintenance.
