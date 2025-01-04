-- Plugins
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  use "nvim-lua/plenary.nvim"

  -- Git Related Plugins
  use "tpope/vim-fugitive"
  use "airblade/vim-gitgutter"

  -- UI
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
   'nvim-lualine/lualine.nvim',
   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'lukas-reineke/indent-blankline.nvim'
    -- config = function() require("ibl").setup {} end
  }
  -- no neckpain
  use {"shortcuts/no-neck-pain.nvim", tag = "*" }
  -- barbar for tab bar
  use 'nvim-tree/nvim-web-devicons'
  -- use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

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

  -- folding
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- Languages/Syntax
  --use {
  --      'nvim-treesitter/nvim-treesitter',
  --      run = ':TSUpdate'
  --  }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,

    }
-- package management
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"
  use "cappyzawa/starlark.vim"
  -- for rego
  use "kitagry/regols"
  -- for commenting
  -- use "numToStr/Comment.nvim"
  -- for highlighting words
  use "rrethy/vim-illuminate"
  -- for auto closing brackets/etc
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        dependencies = "nvim-treesitter/nvim-treesitter",
  }

  -- vscode like peek
   use{
      "dnlhc/glance.nvim",
      config = function()
        require('config.glance').setup()
      end,
    }
  -- lsp formatter (async)
  use "lukas-reineke/lsp-format.nvim"
  -- vim-tfsec
  use "aquasecurity/vim-tfsec"
  -- trouble, show file diagnostics in bottom section
  use {
     "folke/trouble.nvim",
     requires = { 'kyazdani42/nvim-web-devicons'}
    }
  -- icons in nvim-cmp
  use "onsails/lspkind.nvim"

  -- neoscroll - smooth scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup {
            -- All these keys will be mapped to their corresponding default scrolling animation
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            -- easing_function = nil,       -- Default easing function
            -- pre_hook = nil,              -- Function to run before the scrolling animation starts
            -- post_hook = nil,             -- Function to run after the scrolling animation ends
            performance_mode = true,    -- Disable "Performance Mode" on all buffers.
        }
    end
  }
  -- Vimspector - debugging
  use "puremourning/vimspector"

  -- vim tmux navigator
  use "christoomey/vim-tmux-navigator"

  -- Vim help
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- hardtime - to break bad habits
  use {
   "m4xshen/hardtime.nvim",
   requires = { 'MunifTanjim/nui.nvim', "nvim-lua/plenary.nvim" }
  }

  -- for trailing whitespace
  --  use { 'johnfrankmorgan/whitespace.nvim' }
  use { 'ntpeters/vim-better-whitespace' }
  -- Themes
  use "EdenEast/nightfox.nvim" -- Packer
  use "folke/tokyonight.nvim"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

