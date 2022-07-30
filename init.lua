require "plugins"

-- Colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme ayu]]
vim.cmd [[highlight link CompeDocumentation NormalFloat]]

vim.g.t_Co = 256

-- Format on save
-- vim.api.nvim_command("au BufWrite * :Neoformat")

require "mappings"
require "opts"
