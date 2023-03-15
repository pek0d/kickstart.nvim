-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Settings for nvim-tree disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Autoformat after save file
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- Lazygit run
function runLazyGit()
  local Terminal = require('toggleterm.terminal').Terminal
  local run = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    close_on_exit = true,
  })

  run:toggle()
end

-- Custom keymaps
vim.keymap.set("n", "<C-s>", ":write<CR>")
vim.keymap.set("n", "<leader>vv", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>lua runLazyGit()<CR>")


-- Install custom plugins with setups for Pek0d
return {
  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        view = {
          float = {
            enable = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
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
      })
    end
  },

  -- colorscheme tokyonight
  {
    'folke/tokyonight.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("tokyonight").setup({
        style = "storm", -- storm, moon, day, night
        transparent = false,
      })
      -- load the colorscheme here
      vim.cmd [[colorscheme tokyonight]]
    end,
  },

  -- toggleterm
  { 'akinsho/toggleterm.nvim', version = "*", config = true },

  -- Gitsigns near linenumber
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {}
    end
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {}
    end
  },

}
