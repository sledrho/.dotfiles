local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then return end



nvimtree.setup {
   auto_reload_on_write = true,
   open_on_setup = true,
   view = {
        side = 'right',
        width = 45,
        mappings = {
            custom_only = false,
            list = {
               { key = "<C-k>", action = "" },
            },
        },
    }
}
