-- escape with 'jj' mapping
vim.keymap.set("i", "jj", "<esc>", {})
vim.keymap.set("t", "jj", "<esc>", {})

-- Leader
vim.g.mapleader = " "
-- Telescope
vim.keymap.set("n", "<Leader>gs", [[<Cmd> Telescope git_status <CR>]], {})
vim.keymap.set("n", "<Leader>gc", [[<Cmd> Telescope git_commits <CR>]], {})
vim.keymap.set("n", "<C-p>", [[<Cmd> Telescope find_files <CR>]], {})
vim.keymap.set("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], {})
vim.keymap.set("n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], {})
vim.keymap.set("n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], {})
vim.keymap.set("n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]], {})

-- CommentToggle
vim.keymap.set("n", "++", ":CommentToggle<CR>", {})
vim.keymap.set("v", "++", ":CommentToggle<CR>", {})

-- Tabs
vim.keymap.set("i", "<Tab>", "<c-o>:call search('\\|)\\|]\\|>\\}', 'cW')<cr><Right>", {})

-- Git
vim.keymap.set("n", "<Leader>,", ":Git<CR>", {})
vim.keymap.set("n", "<Leader><Leader>,", ":DiffviewOpen<CR>", {})
vim.keymap.set("n", "<Leader>df", ":vertical Gdiffsplit<CR>", {})
vim.keymap.set("n", "<Leader>gp", ":G push<CR>", {})
vim.keymap.set("v", "<Leader>sh", ":Gitsigns stage_hunk<CR>", {})

-- Tabs switch
vim.keymap.set("n", "<Tab>", ":tabn<CR>", {})
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", {})

-- Navigation
vim.keymap.set("n", "k", "kzz", {})
vim.keymap.set("n", "j", "jzz", {})

-- Window panes
vim.keymap.set("n", ":sw", "<C-w><C-x>", {})

-- NvimTree
vim.keymap.set("n", "<Leader>n", ":NvimTreeToggle<CR>", {})

-- Symbols outline
vim.keymap.set("n", "<Leader>so", ":SymbolsOutline<CR>", {})

-- Trouble.nvim
vim.keymap.set("n", "<Leader>t", ":TroubleToggle<CR>", {})

-- Github
vim.keymap.set("n", "<Leader>gh", ":Octo actions<CR>", {})

--Rename
vim.keymap.set("n", "<Leader>r", ":IncRename ", {})
