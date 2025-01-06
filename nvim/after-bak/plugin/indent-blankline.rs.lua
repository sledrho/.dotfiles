local status, ibl = pcall(require, 'ibl')
if (not status) then return end

ibl.setup {
  -- show_trailing_blankline_indent = false,
  -- default : {'class', 'function', 'method'}
}
