local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer
    use {"wbthomason/packer.nvim", event = "VimEnter"}
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require('modules.telescope') end
    }
    -- Vim Fugitive
    use 'https://github.com/tpope/vim-fugitive'
    --  Lightline
    use 'itchyny/lightline.vim'
    -- Autoclose tag
    use 'alvan/vim-closetag'
    -- Tmux-Vim
    use 'christoomey/vim-tmux-navigator'
    -- Better comments
    use 'jbgutierrez/vim-better-comments'
    -- nvim-commment
    use "terrortylor/nvim-comment"
    -- Vim colors
    use 'ap/vim-css-color'
    -- Vim.sorround
    use 'tpope/vim-surround'
    -- Restore folding
    use 'vim-scripts/restore_view.vim'
    -- Startify
    use 'mhinz/vim-startify'
    -- Smoothie
    use 'psliwka/vim-smoothie'
    -- One Dark
    use 'joshdick/onedark.vim'
    -- Formatter
    use 'sbdchd/neoformat'
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        config = function() require 'modules.treesitter' end
    }
    -- Sidebar
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        config = function() require 'modules.nvimtree' end
    }

    use {"kabouzeid/nvim-lspinstall", event = "BufRead"}

    use {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = function() require "modules.lspconfig" end
    }

    use {
        "onsails/lspkind-nvim",
        event = "BufRead",
        config = function() require("modules.others").lspkind() end
    }

    -- Code completion
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function() require "modules.compe" end,
        wants = "LuaSnip",
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function() require "modules.luasnip" end
            }, {"rafamadriz/friendly-snippets", event = "InsertCharPre"}
        }
    }

    use {"andymass/vim-matchup", event = "CursorMoved"}

    --   use "alvan/vim-closetag" -- for html autoclosing tag

    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function() require("modules.others").blankline() end
    }

    -- auto-pairs
    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function() require "modules.autopairs" end
    }
    -- Lsp signature
    use {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".setup() end
    }

    -- TODOs management
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {

        }
      end
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }

end)
