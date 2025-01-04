local Plugin = {'kyazdani42/nvim-tree.lua'}

-- Plugin.cmd("NvimTreeToggle")

Plugin.opts = {
   auto_reload_on_write = true,
   view = {
        side = 'left',
        width = 30,
        mappings = {
            custom_only = false,
            list = {
               { key = "<C-k>", action = "" },
               { key = "f", action = "" },
            },
        },
    },
    renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "icon",
        root_folder_modifier = ':~',
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            },
        },
    },
    filters = {
        dotfiles = false,
    },
}

return Plugin
-- local status, nvimtree = pcall(require, 'nvim-tree')
-- if (not status) then return end

-- nvimtree.setup {
--    auto_reload_on_write = true,
--    view = {
--         side = 'left',
--         width = 30,
--         mappings = {
--             custom_only = false,
--             list = {
--                { key = "<C-k>", action = "" },
--                { key = "f", action = "" },
--             },
--         },
--     },
--     renderer = {
--         add_trailing = true,
--         group_empty = true,
--         highlight_git = true,
--         full_name = false,
--         highlight_opened_files = "icon",
--         root_folder_modifier = ':~',
--         indent_width = 2,
--         indent_markers = {
--             enable = true,
--             inline_arrows = true,
--             icons = {
--               corner = "└",
--               edge = "│",
--               item = "│",
--               bottom = "─",
--               none = " ",
--             },
--         },
--     },
--     filters = {
--         dotfiles = false,
--     },
-- }
