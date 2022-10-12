-- Language Server
local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end


-- nvim  cmp

local cmp = require('cmp')





cmp.setup({
  snippet = {

  }
})


-- language specific config
-- Python
require('lspconfig').pyright.setup{}

-- Terraform
require('lspconfig').terraformls.setup{}

-- Golang
require('lspconfig').golangci_lint_ls.setup{}

-- Lua
require('lspconfig').luau_lsp.setup{}
