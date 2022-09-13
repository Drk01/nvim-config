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

-- Leader
vim.g.mapleader = " "
-- Telescope
map("n", "<Leader>gs", [[<Cmd> Telescope git_status <CR>]], opt)
map("n", "<Leader>gc", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<C-p>", [[<Cmd> Telescope find_files <CR>]], opt)
map("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], opt)
map("n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], opt)
map("n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], opt)
map("n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]], opt)

-- CommentToggle
map("n", "++", ":CommentToggle<CR>", opt)
map("v", "++", ":CommentToggle<CR>", opt)

-- Tabs
map("i", "<Tab>", "<c-o>:call search('\\|)\\|]\\|>\\}', 'cW')<cr><Right>", opt)

-- Git
map("n", "<Leader>,", ":Git<CR>", opt)
map("n", "<Leader><Leader>,", ":DiffviewOpen<CR>", opt)
map("n", "<Leader>df", ":vertical Gdiffsplit<CR>", opt)
map("n", "<Leader>gp", ":G push<CR>", opt)
map("v", "<Leader>sh", ":Gitsigns stage_hunk<CR>", opt)

-- Tabs switch
map("n", "<Tab>", ":tabn<CR>", opt)
map("n", "<S-Tab>", ":tabprevious<CR>", opt)

-- Navigation
map("n", "k", "kzz", opt)
map("n", "j", "jzz", opt)

-- Window panes
map("n", ":sw", "<C-w><C-x>", opt)

-- Formatter
map("n", "<Leader><Leader>", ":Neoformat<CR>", opt)
map("v", "<Leader><Leader>", ":Neoformat<CR>", opt)

-- NvimTree
map("n", "<Leader>n", ":NvimTreeToggle<CR>", opt)

-- Symbols outline
map("n", "<Leader>so", ":SymbolsOutline<CR>", opt)

-- Trouble.nvim
map("n", "<Leader>t", ":TroubleToggle<CR>", opt)

-- Omnifunction
map("i", "<C-Leader>", "<C-x><C-o>")

-- Github
map("n", "<Leader>gh", ":Octo actions<CR>", opt)

--Rename
map("n", "<Leader>r", ":IncRename ", opt)
