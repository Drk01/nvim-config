-- Colorscheme
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]
vim.g.t_Co=256

-- Lightline
vim.g.lightline = {
  colorscheme = 'onedark',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Autoclose tags
vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.tsx,*.js'
vim.g.closetag_close_shortcut = '<leader>>'
vim.g.closetag_shortcut = '>'

require 'plugins'
require 'mappings'
require 'opts'
