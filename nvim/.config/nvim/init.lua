-- Sharing config between NeoVim and Vim
-- https://neovim.io/doc/user/nvim.html#nvim-from-vim
vim.cmd('set runtimepath^=~/.vim runtimepath+=~/.vim/after')
vim.o.packpath = vim.o.runtimepath
vim.cmd('source ~/.vimrc')

-- Disable netrw to be replaced with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Plugins with Lazy.nvim
require("plugins")

-- Catppuccin
-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- LSP
vim.lsp.enable({
    "lua_ls",
    "pyright",
})
