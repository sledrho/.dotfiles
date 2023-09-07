local status, nvim_lsp = pcall(require, 'hardtime')
if (not status) then return end
require("hardtime").setup()
