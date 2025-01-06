-- Shows indentation guides for indent blocks
-- Type: UI
local Plugin = {'lukas-reineke/indent-blankline.nvim'}

Plugin.event = {'BufReadPost', 'BufNewFile'}
Plugin.main = 'ibl'
Plugin.opts = {}

return Plugin
