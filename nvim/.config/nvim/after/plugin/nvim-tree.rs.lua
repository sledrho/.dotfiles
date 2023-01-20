local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then return end

nvimtree.setup {
   auto_reload_on_write = true,
   open_on_setup = true,
   view = {
        side = 'left',
        width = 45,
        mappings = {
            custom_only = false,
            list = {
               { key = "<C-k>", action = "" },
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
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          default = '',
          symlink = '',
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌"
            },
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
            },
        },
  }
