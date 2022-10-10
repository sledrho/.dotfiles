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

  -- Languages/Syntax
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }



  -- Themes
  use "EdenEast/nightfox.nvim" -- Packer


end)
