-- Plugins

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  -- Git Related Plugins
  use "tpope/vim-fugitive"
  use "airblade/vim-gitgutter"

  -- UI
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  }
  use {
   'nvim-lualine/lualine.nvim',
   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- file browser
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- yaml folding
  use {
   'pedrohdz/vim-yaml-folds'
  }

  -- Languages/Syntax
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/nvim-compe"
  use "hrsh7th/cmp-nvim-lsp"


  -- Vim help
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Themes
  use "EdenEast/nightfox.nvim" -- Packer


end)
