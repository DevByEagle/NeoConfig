local fn = vim.fn
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

if fn.empty(fn.glob(fn.stdpath('data')..'/site/package/packer/start/packer.nvim')) > 0 then
  fn.system{'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'}
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      tag = "0.1.8",
      requires = { {'nvim-lua/plenary.nvim'}, {'nvim-tree/nvim-web-devicons'} }
    }
    use 'feline-nvim/feline.nvim'
    use 'morhetz/gruvbox'
end)

cmd[[
  filetype plugin indent on
  syntax on
  colorscheme gruvbox
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
-- Setup
require('telescope').setup {
  defaults = {
    layout_strategy = "flex",
    layout_config = {
        flex = {
            flip_columns = 150,
        },
    },
    sorting_strategy = "ascending",
    prompt_prefix = "🔍 ",
    selection_caret = "👉 ",
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
  }
}

require('nvim-web-devicons').setup {
  default = true;
}

require('feline').setup({
  theme = {
      bg = '#1E1E1E',
      fg = '#FFFFFF',
      yellow = '#DCDCAA',
      cyan = '#4EC9B0',
      green = '#6A9955',
      orange = '#CE9178',
      magenta = '#569CD6',
      red = '#F44747',
  }  
})

vim.api.nvim_set_keymap('n', "<C-s>", ":w<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "<C-f>", ":Telescope find_files<CR>", { noremap = true, silent = true})
