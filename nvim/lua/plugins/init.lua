local Plugins = {
    {'m4xshen/hardtime.nvim',
    event = 'VeryLazy',
    dependencies =  {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
        },
    },
    {'christoomey/vim-tmux-navigator'},
    {'tpope/vim-fugitive'},
    {'ntpeters/vim-better-whitespace'},
}

return Plugins
