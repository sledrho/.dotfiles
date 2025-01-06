local Plugin = {'williamboman/mason.nvim'}

Plugin.dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
}

function Plugin.config()
        require('mason').setup()

        require('mason-lspconfig').setup({
            automatic_installation = true,
            ensure_installed = {
                'cssls',
                'eslint',
                'golangci_lint_ls',
                'gopls',
                'html',
                'jsonls',
                'lua_ls',
                'pyright',
                'tailwindcss',
                'yamlls',
                'tflint',
                'terraformls',
            },
        })

        require('mason-tool-installer').setup({
            ensure_installed = {
                'prettier',
                'stylua', -- lua formatter
                'isort', -- python formatter
                'black', -- python formatter
                'pylint',
                'eslint_d',
                'gofumpt',
                'golangci-lint',
                'goimports-reviser',
            },
        })
end

return Plugin
