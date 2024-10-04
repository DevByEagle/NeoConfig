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
      requires = { { 'nvim-lua/plenary.nvim','nvim-tree/nvim-web-devicons' }}
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
require('telescope').setup {
  defaults = {
    -- Add your default configurations here
    -- This is where we enable file icons
    layout_strategy = "flex",
    layout_config = {
        flex = {
            flip_columns = 150,
        },
    },
    -- Custom sorting function to include icons
    sorting_strategy = "ascending",
    prompt_prefix = "🔍 ", -- Change this to whatever you prefer
    selection_caret = "👉 ", -- Change this to whatever you prefer
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
  }
}

require('nvim-web-devicons').setup {
  default = true;
}

-- Keymaps
vim.api.nvim_set_keymap('n', "<C-s>", ":w<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "<C-f>", ":Telescope find_files<CR>", { noremap = true, silent = true})
