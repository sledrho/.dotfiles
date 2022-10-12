require('sledrho.base')
require('sledrho.theme')
require('sledrho.mappings')
require('sledrho.plugins')


-- Autocommand for Terraform-Language-Server
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = vim.lsp.buf.formatting_sync,
})
