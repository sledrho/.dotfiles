require('sledrho.base')
require('sledrho.theme')
require('sledrho.mappings')
require('sledrho.plugins')
require('sledrho.funcs')

vim.g.loaded_netrw = 1
-- Autocommand for Terraform-Language-Server
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--   pattern = {"*.tf", "*.tfvars"},
--   callback = vim.lsp.buf.formatting_sync,
-- })
