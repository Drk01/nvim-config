require "plugins"

require("mason").setup()
require("mason-lspconfig").setup()

-- Colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme ayu]]
vim.cmd [[highlight link CompeDocumentation NormalFloat]]
vim.cmd [[set foldmethod=expr]]
vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
vim.cmd [[set foldexpr=v:lnum==1?'>1':getline(v:lnum)=~'import'?1:nvim_treesitter#foldexpr()]]

vim.g.t_Co = 256

-- Format on save
vim.api.nvim_command("au BufWrite * :Neoformat")

require "mappings"
require "opts"
