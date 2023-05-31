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


-- LSP Formatter
require('lsp-format').setup{}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- language specific config
-- Python
require('lspconfig').pyright.setup{
    on_attach = require('lsp-format').on_attach,
    flags = lsp_flags,
}

-- Terraform
require('lspconfig').terraformls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "tf", "terraform"},
    root_dir = nvim_lsp.util.root_pattern("terraform", ".terraform"),
    cmd = {"terraform-ls", "serve"}
}
-- tflint
require('lspconfig').tflint.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "tf", "terraform"},
    root_dir = nvim_lsp.lsp.util.root_pattern("terraform",".terraform"),
    cmd = { "tflint", "--langserver"}
}

-- rego

-- require('lspconfig').regols.setup{
--   on_attach = on_attach,
--   cmd = {'regols'},
--   filetypes = { 'rego' },
--   root_dir = nvim_lsp.util.root_pattern(".git")
-- }

if not configs.regols then
  configs.regols = {
    default_config = {
      cmd = {'regols'};
      filetypes = { 'rego' };
      root_dir = nvim_lsp.util.root_pattern(".git");
    }
  }
end
require('lspconfig').regols.setup{}
-- Starlark (custom implementation)
-- require('lspconfig').starlarkls.setup{
--     filetypes = { ".drone.star", ".star" },
--     on_attach = on_attach,
-- }

require('lspconfig').gopls.setup{
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("go.mod",".git"),
    single_file_support = true,
    flags = lsp_flags,
}


require('lspconfig').golangci_lint_ls.setup{
    filetypes = {'go','gomod'},
    on_attach = on_attach,
    flags = lsp_flags,
}


-- Lua
require('lspconfig').luau_lsp.setup{
    filetypes = {'lua'},
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Yaml
require'lspconfig'.yamlls.setup{
    on_attach=on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
                ["/Users/rory.sheldon/.config/nvim/local-schema/cloud-custodian.json"] = "*.yml",
            }
        }
    }
}


-- JSON
require('lspconfig').jsonls.setup{
    filetypes = {"json", "jsonc"},
    on_attach=on_attach,
}
