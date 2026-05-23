-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable project-local config files (.nvim.lua, .nvimrc, .exrc)
vim.o.exrc = true

-- Single global statusline (not per-split) — prevents bottom bar bloat
vim.opt.laststatus = 3

-- Don't auto-equalize split sizes when opening/closing splits
vim.opt.equalalways = false

-- Minimal command line height
vim.opt.cmdheight = 1

-- Disable LSP folding ranges (workaround for Neovim 0.11.2 bug)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.g.lazyvim_blink_main = false
