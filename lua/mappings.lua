-- Toogle comments
require('nvim_comment').setup()

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- escape with 'jj' mapping
vim.api.nvim_set_keymap("i", "jj", "<esc>", {})
vim.api.nvim_set_keymap("t", "jj", "<esc>", {})

local t = function(str)
return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

function _G.completions()
    local npairs
    if
        not pcall(
            function()
                npairs = require "nvim-autopairs"
            end
        )
     then
        return
    end

    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

-- Leader 
vim.g.mapleader = "ñ"
-- Telescope
map("n", "<Leader>gs", [[<Cmd> Telescope git_status <CR>]], opt)
map("n", "<Leader>gc", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<C-p>", [[<Cmd> Telescope find_files <CR>]], opt)
map("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], opt)
map("n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], opt)
map("n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], opt)
map("n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]], opt)

-- CommentToggle
map("n","++",":CommentToggle<CR>",opt)
map("v","++",":CommentToggle<CR>",opt)

-- Tabs
map("i","<Tab>", "<c-o>:call search('\\|)\\|]\\|>\\}', 'cW')<cr><Right>",opt)

-- Git
map("n", ",", ":Git<CR>",opt)
map('n', '<Leader>df', ':vertical Gdiffsplit<CR>', opt)
map('n', '<Leader>gp', ':G push<CR>', opt)

-- Tabs switch
map("n", "<Tab>", ":tabNext<CR>", opt)
map("n", "<S-Tab>", ":tabprevious<CR>", opt)

-- Navigation
map('n', "k", "kzz", opt)
map('n', "j", "jzz", opt)

-- Window panes
map('n',':sw', "<C-w><C-x>", opt)

-- Formatter
map('n','<Leader>ñ', ":Neoformat<CR>", opt)
map('v','<Leader>ñ', ":Neoformat<CR>", opt)

-- Terminal
map('n','<Leader>t', ':split term://bash<CR>',opt)

-- NvimTree
map("n",";",":NvimTreeToggle<CR>",opt)

-- Nvim-compe
-- inoremap <silent><expr> <C-Space> compe#complete()
-- map('n','<C-Space>', 'compe#complete()', opts)
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
map('i', '<CR>', 'compe#confirm({"keys": "<CR>", "select": v:true })', {expr = true})
