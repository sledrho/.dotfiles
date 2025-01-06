local Plugin = {'folke/which-key.nvim'}

function Plugin.config()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
end

return Plugin
