require "plugins"

-- Colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]
vim.cmd [[highlight link CompeDocumentation NormalFloat]]

vim.g.t_Co = 256

-- Lightline
vim.g.lightline = {
    active = {
        left = {
            {"mode", "paste"},
            {"gitbranch", "readonly", "filename", "modified"}
        }
    },
    component_function = {gitbranch = "fugitive#head"}
}
-- Format on save: Only works with Typescript
vim.api.nvim_command("au BufWrite * :Neoformat")

-- Vimspector
vim.cmd [[ let g:vimspector_enable_mappings = 'VISUAL_STUDIO' ]]

require "mappings"
require "opts"
