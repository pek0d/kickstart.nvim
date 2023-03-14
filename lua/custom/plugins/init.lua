-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Autoformat after save file
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

return {
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
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  -- null-ls for custom LSP server formatting
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('null-ls').setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.formatting.prettier,
        },
        capabilities = capabilities,
        on_attach = on_attach,
      }
    end,
  },
}
