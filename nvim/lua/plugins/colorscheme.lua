local Plugin = {'folke/tokyonight.nvim'}

Plugin.lazy = false
Plugin.priority = 1000

function Plugin.config()
    vim.cmd("colorscheme tokyonight-storm")
end

return Plugin
