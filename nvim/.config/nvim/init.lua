-- local load = function(mod) 
--     package.loaded[mod] = nil
--     require(mod)
-- end
--
-- load('user.settings')
-- load('user.keymaps')
-- require('user.plugins')

require('sledrho.plugins')
require('sledrho.base')
require('sledrho.theme')
require('sledrho.mappings')
require('sledrho.funcs')

-- local function open_nvim_tree()
--     -- open the tree
--     require("nvim-tree.api").tree.open()
-- end

vim.g.loaded_netrw = 1
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
