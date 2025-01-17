local Plugin = {'windwp/nvim-autopairs'}
Plugin.event = 'InsertEnter'
Plugin.config = true
Plugin.lazy = false

Plugin.opts = {
    check_ts = true,
    ts_config = {
        lua = {'string'},
    }
}
-- -- to enable autopairs to use treesitter
-- local npairs = require('nvim-autopairs')
-- local Rule = require('nvim-autopairs.rule')
--
-- npairs.setup({
--     check_ts = true,
--     ts_config = {
--         lua = {'string'},
--     }
-- })
--
-- local ts_conds = require('nvim-autopairs.ts-conds')
-- -- press % => %% only while inside a comment or string
-- npairs.add_rules({
--   Rule("%", "%", "lua")
--     :with_pair(ts_conds.is_ts_node({'string','comment'})),
--   Rule("$", "$", "lua")
--     :with_pair(ts_conds.is_not_ts_node({'function'}))
-- })

return Plugin
