-- Language Server
local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local configs = require 'lspconfig/configs'

-- nvim  cmp

local cmp = require('cmp')





cmp.setup({
  snippet = {
      expand = function(args)
          require('luasnip').lsp_expand(args.body)
    end,
  },

  window = {

  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
}, {
    { name = buffer },
  })
})


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- language specific config
-- Python
require('lspconfig').pyright.setup{}

-- Terraform
require('lspconfig').terraformls.setup{}

-- Golang

if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" };
			}
		};
	}
end

require('lspconfig').golangci_lint_ls.setup{
    filetypes = {'go','gomod'}
}


-- Lua
require('lspconfig').luau_lsp.setup{}
