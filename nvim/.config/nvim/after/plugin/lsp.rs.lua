-- Language Server

local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local configs = require 'lspconfig.configs'

-- nvim  cmp
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
      expand = function(args)
          require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
        mode = "symbol_text",
        menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
        }),
    }),
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
      {name = 'path'},
      {name = 'nvim_lsp', keyword_length = 1},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
  })
})

-- LSP Formatter
require('lsp-format').setup{}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

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

-- setup mason
local status = pcall(require, 'mason')
if (not status) then return end

local handlers = {
    function (server)
        lspconfig[server].setup({
            capabilities = capabilities,
        })
    end,
}

require("mason").setup({
    handlers = handlers,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("lspconfig").snyk_ls.setup{
    init_options = {
        activateSnykCode = "true",
        activatedSnykIac = "true",
-- cliPath = "/Users/rorysheldon/.asdf/shims/snyk",
        cliPath = "/Users/rorysheldon/snyk-manual",
        authenticationMethod = "token",
        token = os.getenv("SNYK_TOKEN"),
        -- automaticAuthentication = "true",
        scanningMode = "auto",
        integrationName = "neovim",
        integrationVersion = "0.10.0",
    },
    filetypes = { "go", "gomod", "javascript", "typescript", "json", "python", "requirements", "helm", "terraform", "terraform-vars" }
}

require("mason-lspconfig").setup()

-- language specific config
-- Python
require('lspconfig').pyright.setup{
    on_attach = require('lsp-format').on_attach,
    flags = lsp_flags,
    filetypes = { 'python' },
    single_file_support = true,
    root_dir = nvim_lsp.util.root_pattern(".tool-versions",".git"),
    cmd = { "pyright-langserver", "--stdio"},
}

-- Terraform
require('lspconfig').terraformls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "tf", "terraform"},
    root_dir = nvim_lsp.util.root_pattern("terraform", ".terraform", ".git"),
    cmd = {"terraform-ls", "serve"}
}
-- Autocommand for Terraform-Language-Server
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- autocmd for tf comment string
vim.api.nvim_create_autocmd("FileType", {
  pattern = "terraform",
  callback = function()
    vim.bo.commentstring = "# %s"
  end
})
-- tflint
require('lspconfig').tflint.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "tf", "terraform"},
    root_dir = nvim_lsp.util.root_pattern("terraform",".terraform", ".git"),
    cmd = { "tflint", "--langserver"}
}

-- rego
-- require('lspconfig').regols.setup{
--   on_attach = on_attach,
--   cmd = {'regols'},
--   filetypes = { 'rego' },
--   root_dir = nvim_lsp.util.root_pattern(".git")
-- }

-- if not configs.snyk then
--     configs.snyk = {
--             default_config = {
--                 cmd = {'/usr/local/bin/snyk-ls','-f','/path/to/log/snyk-ls-vim.log'},
--                 root_dir = function(name)
--                     return require('lspconfig').util.find_git_ancestor(name) or vim.loop.os_homedir()
--                 end,
--                 init_options = {
--                     activateSnykCode = "true",
--                     cliPath = "/Users/rorysheldon/.asdf/shims/snyk",
--                 }
--             };
--         }
-- end
--
-- require('lspconfig').snyk.setup {
--   on_attach = on_attach
-- }
--
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
    root_dir = nvim_lsp.util.root_pattern("go.mod",".git"),
    command = { "golangci-lint-langserver", "run", "--out-format", "json" },
    flags = lsp_flags,
}


-- Lua
require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

-- bash
require('lspconfig').bashls.setup{}

-- Yaml
require('lspconfig').yamlls.setup{
    on_attach=on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
                -- ["/Users/rory.sheldon/.config/nvim/local-schema/cloud-custodian.json"] = "*.yml",
                ["/Users/rorysheldon/.config/nvim/local-schema/tm-schema.json"] = "*/riskPatterns/*.yml",
            }
        }
    }
}

-- JSON
require('lspconfig').jsonls.setup{
    filetypes = {"json", "jsonc"},
    on_attach=on_attach,
}
