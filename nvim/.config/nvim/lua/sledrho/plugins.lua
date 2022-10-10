-- Plugins

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Git Related Plugins
  use "tpope/vim-fugitive"
  use "airblade/vim-gitgutter"


  -- Themes
  use "EdenEast/nightfox.nvim" -- Packer


end)
