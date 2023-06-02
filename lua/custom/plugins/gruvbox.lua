-- colorscheme gruvbox
return {
  'ellisonleao/gruvbox.nvim',
  lazy = true, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('gruvbox').setup {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = '', -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = true,
      transparent_mode = false,
    }
    -- load the colorscheme here
    -- vim.cmd.colorscheme 'gruvbox'
  end,
}
