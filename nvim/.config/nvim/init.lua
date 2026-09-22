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

-- Follow macOS light/dark appearance, synced by theme-sync.sh into this file.
-- No push mechanism from the script, so re-check on FocusGained.
local theme_mode_file = vim.fn.expand("~/.cache/theme-mode")
local current_flavour = "mocha"
local function sync_catppuccin_flavour()
    local f = io.open(theme_mode_file, "r")
    if not f then
        return
    end
    local mode = f:read("*l")
    f:close()
    local flavour = mode == "light" and "latte" or "mocha"
    if flavour == current_flavour then
        return
    end
    current_flavour = flavour
    require("catppuccin").setup({
        flavour = flavour,
        transparent_background = true,
        dim_inactive = { enabled = true },
        auto_integrations = true,
    })
    vim.cmd.colorscheme("catppuccin")
end
sync_catppuccin_flavour()
vim.api.nvim_create_autocmd("FocusGained", { callback = sync_catppuccin_flavour })

-- LSP
vim.lsp.enable({
    "lua_ls",
    "pyright",
})
