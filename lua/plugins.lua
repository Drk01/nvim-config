local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
-- Telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}
-- Vim Fugitive
use 'https://github.com/tpope/vim-fugitive'
-- Vim matchit
use 'https://github.com/adelarsq/vim-matchit'
--  Lightline
use 'itchyny/lightline.vim'
-- Vim-Polyglot
use 'sheerun/vim-polyglot'
-- Autoclose tag
use 'alvan/vim-closetag'
-- Tmux-Vim
use 'christoomey/vim-tmux-navigator'
-- Better comments
use 'jbgutierrez/vim-better-comments'
-- nvim-commment
use "terrortylor/nvim-comment"
-- Vim colors
use 'ap/vim-css-color'
-- File line
use 'bogado/file-line'
-- Vim.sorround
use 'tpope/vim-surround'
-- Restore folding
use 'vim-scripts/restore_view.vim'
-- Startify
use 'mhinz/vim-startify'
-- Smoothie
use 'psliwka/vim-smoothie'
-- One Dark
use 'joshdick/onedark.vim'
-- Formatter
use 'sbdchd/neoformat'
-- Sidebar
-- use "nvim-treesitter/nvim-treesitter"

end)

