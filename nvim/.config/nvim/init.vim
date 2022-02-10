
" Sets - Basic Settings "
"""""""""""""""""""""""""

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
"" Needs plugin.
set undodir=~/.nvim/undodir
set undofile
set incsearch
set termguicolors

"" Start scrolling when the bottom is 8 lines away from the cursor
set scrolloff=8

"" Adds an additional column
set signcolumn=yes
" Warning column at 80characters, indicates too much indenting maybe? lol
set colorcolumn=85

" Gives more space for displaying messages
set cmdheight=2

" Python Black-NVIM Config Req
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'

"""""""""""
" PLUGINS "
"""""""""""
call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mhartington/oceanic-next'
Plug 'haystackandroid/vimspectr'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'averms/black-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

if !exists("g:syntax_on")
    syntax enable
endif

colorscheme OceanicNext
highlight Normal guibg=none


""""""""""
" REMAPS "
""""""""""


let mapleader =  " "
" For telescope, takes vim input and searches via telescope
nnoremap <leader>ps <cmd>lua  require("telescope.builtin").grep_string({ search vim.fn.input("Grep For > ")})<CR>

"" Telescope Configuration using Telescope Command-Line Sugar
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


""""""""""""""""
" AUTOCOMMANDS "
""""""""""""""""

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Call autocmd!: this clears the listeners whenever the file is sourced,
" prevents numerous listeners from being loaded in a single session (i.e 5
" whitespace removal listeners
augroup SHELDOR
    autocmd!
    " For All Filetypes in current buffer, call TrimWhitespace func without
    " any args.
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

