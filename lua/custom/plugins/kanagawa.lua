return {
  'rebelot/kanagawa.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('kanagawa').setup {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = true, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      theme = 'wave', -- Load "wave" theme when 'background' option is not set
      background = {
        -- map the value of 'background' option to a theme
        dark = 'wave', -- try "dragon" !
        light = 'lotus',
      },
    }
    -- load the colorscheme here
    -- vim.cmd [[colorscheme kanagawa]]
  end,
}
