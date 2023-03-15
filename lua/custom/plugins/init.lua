-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Autoformat after save file
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- lazygit run
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

vim.keymap.set("n", "<leader>gl", "<cmd>lua runLazyGit()<CR>")



-- install custom plugins for Pek0d
-- insert for lazy
return {
  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
  -- colorscheme tokyonight
  {
    'folke/tokyonight.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
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
  -- paste up-down
  { 'tpope/vim-surround', },

  -- autopairs
  { 'windwp/nvim-autopairs' },
}
