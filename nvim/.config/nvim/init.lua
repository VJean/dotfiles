-- Sharing config between NeoVim and Vim
-- https://neovim.io/doc/user/nvim.html#nvim-from-vim
vim.cmd('set runtimepath^=~/.vim runtimepath+=~/.vim/after')
vim.o.packpath = vim.o.runtimepath
vim.cmd('source ~/.vimrc')

-- Setting up the lazy.nvim package manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Setting up plugins with lazy.nvim
require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.7',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    }
})

-- Telescope
local tsbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tsbuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', tsbuiltin.live_grep, {})
vim.keymap.set('n', '<leader>fb', tsbuiltin.buffers, {})
vim.keymap.set('n', '<leader>fh', tsbuiltin.help_tags, {})

-- Catppuccin
require("catppuccin").setup({
    flavour = "mocha",
})
-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

