-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information


-- Autoformat after save file
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })]]

-- Lazygit run
function runLazyGit()
  local Terminal = require('toggleterm.terminal').Terminal
  local run = Terminal:new {
    cmd = 'lazygit',
    hidden = true,
    direction = 'float',
    close_on_exit = true,
  }

  run:toggle()
end

-- Custom keymaps
vim.keymap.set('n', '<C-s>', ':write<CR>')
vim.keymap.set('n', '<leader>qq', ':wqall<CR>')
vim.keymap.set('n', '<leader>vv', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>gl', '<cmd>lua runLazyGit()<CR>')

-- Install custom plugins with scustom setups for Pek0d
return {
  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        view = {
          float = {
            enable = true,
            open_win_config = {
              relative = 'editor',
              border = 'rounded',
              width = 90,
              height = 90,
              row = 80,
              col = 80,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = false,
        },
      }
    end,
  },
  -- colorscheme tokyonight
  {
    'folke/tokyonight.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('tokyonight').setup {
        style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day",    -- The theme is used when the background is set to light
        transparent = true,     -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark",             -- style for sidebars, see below
          floats = "dark",               -- style for floating windows
        },
        sidebars = { "qf", "help" },     -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3,            -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = true, -- will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = true,             -- dims inactive windows
        lualine_bold = true,             -- When `true`, section headers in the lualine theme will be bold
      }
      -- load the colorscheme here
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  -- colorscheme kanagawa
  {
    'rebelot/kanagawa.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("kanagawa").setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        theme = "wave",        -- Load "wave" theme when 'background' option is not set
        background = {
          -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })
      -- load the colorscheme here
      -- vim.cmd [[colorscheme kanagawa]]
    end,
  },
  -- colorscheme gruvbox
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "",  -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = true,
        transparent_mode = false,
      })
      -- load the colorscheme here
      -- vim.cmd [[colorscheme gruvbox]]
    end,
  },
  -- colorscheme vscode
  {
    'Mofiqul/vscode.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("vscode").setup({
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
      })
      -- load the colorscheme here
      -- vim.cmd [[colorscheme vscode]]
    end,
  },
  -- Toggleterm
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {}
    end,
  },
  -- Colorizer
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {}
    end,
  },
  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },
  -- null-ls custom formatting
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.autopep8,
        },
      }
    end,
  },
  -- dashboard
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  }
}
