
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
" Vim fold
set foldlevelstart=20

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'dense-analysis/ale'
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


" For Nvim-tree

let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

" For yamllint
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

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

"   For nvim-tree
lua << EOF
require'nvim-tree'.setup {
   auto_reload_on_write = true,
   open_on_setup = true,
}
EOF

" For YAML auto-indentation.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
