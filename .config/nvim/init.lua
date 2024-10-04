local fn = vim.fn
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

if fn.empty(fn.glob(fn.stdpath('data')..'/site/package/packer/start/packer.nvim')) > 0 then
  fn.system{'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'}
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      tag = "0.1.8",
      requires = { { 'nvim-lua/plenary.nvim ' }}
    }
    -- Colorschemes
    use 'morhetz/gruvbox'
end)

cmd[[
  filetype plugin indent on
  syntax on
]]

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.wrap = false
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = 'yes'
vim.cmd([[colorscheme gruvbox]])

-- Setup
require('telescope').setup()

-- Keymaps
vim.api.nvim_set_keymap('n', "<C-s>", ":w<CR>", { noremap = true, silent = true})
