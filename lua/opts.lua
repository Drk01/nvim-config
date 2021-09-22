local set = vim.opt

set.encoding = 'UTF-8'
set.nu = true
set.relativenumber = true
set.shiftwidth = 4
set.expandtab = true
set.exrc = true
set.hidden = true
set.smartcase = true
set.undodir = '/home/derek/.config/nvim/undodir'
set.undofile = true
set.incsearch = true
set.completeopt = 'menuone,noselect'
set.signcolumn = 'yes'
set.cmdheight = 1
set.updatetime = 50
-- set.shortmess = '+=c'
vim.cmd [[ set shortmess+=c ]]
set.colorcolumn = "80"
set.laststatus = 2
set.maxmempattern = 2000000
set.viewoptions = 'cursor,folds,slash,unix'
-- set.foldmethod = 'indent'
vim.cmd [[ set foldmethod=expr ]]
vim.cmd [[ set foldexpr=nvim_treesitter#foldexpr() ]]
set.termguicolors = true

vim.cmd [[ set nohlsearch ]]
vim.cmd [[ set noerrorbells ]]
vim.cmd [[ set nowrap ]]
vim.cmd [[ set noswapfile ]]
vim.cmd [[ set nobackup ]]
vim.cmd [[ set noshowmode ]]

-- set.nohlsearch = true
-- set.noerrorbells = true
-- set.nowrap = true
-- set.noswapfile = true
-- set.nobackup = true
-- set.noshowmode = true
