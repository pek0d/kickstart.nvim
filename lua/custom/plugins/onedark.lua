-- colorscheme onedark
return {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('onedarkpro').setup {
      options = {
        transparency = false,
        highlight_inactive_windows = true,
      },
      styles = {
        comments = 'italic',
        types = 'NONE',
        functions = 'italic',
        keywords = 'bold,italic',
        conditionals = 'italic',
      },
    }
    -- load the colorscheme here
    -- vim.cmd [[colorscheme onedark]]
  end,
}
