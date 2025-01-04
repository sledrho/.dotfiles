-- Basic Settings
local set = vim.opt

-- Tab behaviour
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true
set.smarttab = true


set.smartindent = true
set.guicursor = ""
set.relativenumber = true
set.nu = true
set.hlsearch = false
set.hidden = true
set.errorbells = false
set.wrap = false
set.swapfile = false
set.backup = false

set.scrolloff = 8
set.colorcolumn = '85'

set.cmdheight = 2
set.mouse = 'a'
set.signcolumn = 'yes'

set.foldlevelstart = 20

set.iskeyword:remove({'_'})


set.termguicolors = true

-- To use system clipboard
set.clipboard = 'unnamedplus'


vim.g.loaded_netrw = 1

vim.g.loaded_netrwPlugin = 1

-- for ufo folding 
set.foldcolumn = '1' -- '0' is not bad
set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
set.foldlevelstart = 99
set.foldenable = true
