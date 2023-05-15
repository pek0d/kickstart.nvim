return {
  'Tsuzat/NeoSolarized.nvim',
  lazy = false,
  config = function()
    require('NeoSolarized').setup {
      style = 'dark', -- "dark" or "light"
      transparent = false, -- true/false; Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
      styles = {
        -- Style to be applied to different syntax groups
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        string = { italic = true },
        underline = true, -- true/false; for global underline
        undercurl = true, -- true/false; for global undercurl
      },
    }
    vim.cmd [[colorscheme NeoSolarized]]
  end,
}
