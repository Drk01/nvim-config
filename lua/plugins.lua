local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system(
        {
            "git",
            "clone",
            "https://github.com/wbthomason/packer.nvim",
            install_path
        }
    )
    execute "packadd packer.nvim"
end

return require("packer").startup(
    function()
        -- Packer
        use {"wbthomason/packer.nvim", event = "VimEnter"}
        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
            config = function()
                require("modules.telescope")
            end
        }
        -- Vim Fugitive
        use "https://github.com/tpope/vim-fugitive"
        -- Tmux-Vim
        use "christoomey/vim-tmux-navigator"
        -- Better comments
        use "jbgutierrez/vim-better-comments"
        -- nvim-commment
        use {
            "terrortylor/nvim-comment",
            config = function()
                require("modules.others").comment()
            end
        }
        -- Vim.sorround
        use "tpope/vim-surround"
        -- Restore folding
        use "vim-scripts/restore_view.vim"
        -- neoscroll
        use {
            "karb94/neoscroll.nvim",
            config = function()
                require("modules.others").neoscroll()
            end
        }
        -- One Dark theme
        use "joshdick/onedark.vim"

        -- Formatter
        use "sbdchd/neoformat"
        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            config = function()
                require "modules.treesitter"
            end,
            run = ":TSUpdate"
        }
        -- Sidebar
        use "kyazdani42/nvim-web-devicons"
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = function()
                require "modules.nvimtree"
            end,
            setup = function()
                vim.api.nvim_set_keymap("n", ";", ":NvimTreeToggle<CR>", {})
            end
        }

        use {"kabouzeid/nvim-lspinstall", event = "BufRead"}

        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("modules.others").lspkind()
            end
        }

        use "neovim/nvim-lspconfig"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use {
            "hrsh7th/nvim-cmp",
            config = function()
                require("modules.cmp")
            end
        }
        use "L3MON4D3/LuaSnip"
        use "saadparwaiz1/cmp_luasnip"

        use {"andymass/vim-matchup", event = "CursorMoved"}

        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            setup = function()
                require("modules.others").blankline()
            end
        }

        -- Pear auto-pairs
        use {
            "steelsojka/pears.nvim",
            config = function()
                require("modules.autopairs")
            end
        }
        -- Lsp signature
        use {
            "ray-x/lsp_signature.nvim",
            config = function()
                require "lsp_signature".setup()
            end
        }

        -- TODOs management
        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end
        }

        use {
            "lewis6991/gitsigns.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            config = function()
                require("gitsigns").setup()
            end
        }

        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("modules.others").colorizer()
            end
        }

        use {"windwp/nvim-ts-autotag", event = "InsertEnter"}

        use {"folke/lsp-colors.nvim"}

        use {"jose-elias-alvarez/nvim-lsp-ts-utils"}

        use {"puremourning/vimspector"}

        -- symbols-outline.nvim
        use "simrat39/symbols-outline.nvim"

        -- trouble.nvim
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {}
            end
        }
    end
)
