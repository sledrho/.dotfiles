local status, nvim_ws = pcall(require, 'whitespace')
if (not status) then return end


nvim_ws.setup({
    -- configuration options and their defaults

    -- `highlight` configures which highlight is used to display
    -- trailing whitespace
    highlight = 'diffdelete',

    -- `ignored_filetypes` configures which filetypes to ignore when
    -- displaying trailing whitespace
    ignored_filetypes = { 'telescopeprompt', },
})

-- remove trailing whitespace with a keybinding
vim.api.nvim_set_keymap(
    'n',
    '<leader>t',
    [[<cmd>lua require('whitespace-nvim').trim()<cr>]]
    { noremap = true })
