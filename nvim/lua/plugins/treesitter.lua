local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.build = ':TSUpdate'
Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.opts = {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "rust", "python", "go", "hcl", "bash", "dockerfile", "yaml", "markdown", },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    }
}

return Plugin
