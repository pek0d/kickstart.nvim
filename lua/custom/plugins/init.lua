-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information


-- Autoformat after save file
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })]]

-- Lazygit run
---@diagnostic disable-next-line: lowercase-global
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
-- vim.keymap.set('n', '<leader>ss', ':write<CR>')
vim.keymap.set('n', '<leader>qq', ':wqall<CR>')
vim.keymap.set('n', '<leader>vv', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>gl', '<cmd>lua runLazyGit()<CR>')

-- Custom plugins with custom setups for Pek0d
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
              width = 40,
              height = 30,
              row = 100,
              col = 110,
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
        git = {
          timeout = 500, }
      }
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
        transparent = true,    -- do not set background color
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
      vim.cmd [[colorscheme kanagawa]]
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
        contrast = "",  -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = true,
        transparent_mode = true,
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
        transparent = true,
        italic_comments = true,
        disable_nvimtree_bg = true,
      })
      -- load the colorscheme here
      -- vim.cmd [[colorscheme vscode]]
    end,
  },
  -- Toggleterm
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
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
}
