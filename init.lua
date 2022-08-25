require "plugins"

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end
}

-- Colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme ayu]]
vim.cmd [[highlight link CompeDocumentation NormalFloat]]
vim.cmd [[set foldmethod=expr]]
vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]

vim.g.t_Co = 256

-- Format on save
vim.api.nvim_command("au BufWrite * :Neoformat")

require "mappings"
require "opts"
