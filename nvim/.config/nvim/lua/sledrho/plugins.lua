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
  use "lukas-reineke/indent-blankline.nvim"
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
  --use {
  --      'nvim-treesitter/nvim-treesitter',
  --      run = ':TSUpdate'
  --  }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/nvim-compe"
  use "hrsh7th/cmp-nvim-lsp"
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use 'saadparwaiz1/cmp_luasnip'
  use "cappyzawa/starlark.vim"

  -- lsp formatter (async)
  use "lukas-reineke/lsp-format.nvim"

    -- vim-tfsec
    use "aquasecurity/vim-tfsec"

  -- Vimspector - debugging
  use "puremourning/vimspector"

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

  -- for trailing whitespace
--  use { 'johnfrankmorgan/whitespace.nvim' }
  use { 'ntpeters/vim-better-whitespace' }
  -- Themes
  use "EdenEast/nightfox.nvim" -- Packer


end)
