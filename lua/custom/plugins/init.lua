return {
  -- nvim-tree
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   version = '*',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function()
  --     require('nvim-tree').setup {
  --       actions = {
  --         open_file = {
  --           quit_on_open = true,
  --         },
  --       },
  --       view = {
  --         float = {
  --           enable = true,
  --           open_win_config = {
  --             relative = 'editor',
  --             -- border = 'shadow',
  --             width = 50,
  --             height = 30,
  --             row = 10,
  --             col = 100,
  --           },
  --         },
  --       },
  --       filters = {
  --         dotfiles = false,
  --       },
  --       diagnostics = {
  --         enable = true,
  --         show_on_dirs = false,
  --       },
  --       git = {
  --         timeout = 500, }
  --     }
  --   end
  -- },

  -- neo-tree
  -- {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   branch = "v2.x",
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --     'MunifTanjim/nui.nvim',
  --     's1n7ax/nvim-window-picker'
  --   }


  -- Toggleterm
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true
  },

  -- Colorizer
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        '*',
      }
    end
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
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
    end
  },

  -- markdown preview
  -- after installing by lazy, run `:call mkdp#util#install()`
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },

}
