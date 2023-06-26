return {
  -- colorscheme onedark
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedarkpro').setup {
        styles = {
          types = 'NONE',
          methods = 'NONE',
          numbers = 'NONE',
          strings = 'NONE',
          comments = 'italic',
          keywords = 'bold,italic',
          constants = 'NONE',
          functions = 'italic',
          operators = 'NONE',
          variables = 'NONE',
          parameters = 'NONE',
          conditionals = 'italic',
          virtual_text = 'NONE',
        },
        options = {
          highlight_inactive_windows = true,
          transparency = false,
        },
      }
      -- load the colorscheme here
      vim.cmd [[colorscheme onedark]]
    end,
  },
}
