return
-- colorscheme kanagawa
    {
      'rebelot/kanagawa.nvim',
      lazy = false,  -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require("kanagawa").setup({
          compile = false, -- enable compiling the colorscheme
          undercurl = true, -- enable undercurls
          commentStyle = { italic = true },
          functionStyle = {},
          keywordStyle = { italic = true },
          statementStyle = { bold = true },
          typeStyle = {},
          transparent = false, -- do not set background color
          dimInactive = true,  -- dim inactive window `:h hl-NormalNC`
          terminalColors = true, -- define vim.g.terminal_color_{0,17}
          theme = "wave",      -- Load "wave" theme when 'background' option is not set
          background = {
            -- map the value of 'background' option to a theme
            dark = "wave", -- try "dragon" !
            light = "lotus",
          },
        })
        -- load the colorscheme here
        vim.cmd.colorscheme "kanagawa"
      end
    },

    -- colorscheme gruvbox
    {
      'ellisonleao/gruvbox.nvim',
      lazy = true,   -- make sure we load this during startup if it is your main colorscheme
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
          contrast = "", -- can be "hard", "soft" or empty string
          palette_overrides = {},
          overrides = {},
          dim_inactive = true,
          transparent_mode = false,
        })
        -- load the colorscheme here
        -- vim.cmd.colorscheme "gruvbox"
      end
    },

    -- colorscheme catppuccin
    {
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = true,
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "latte", -- latte, frappe, macchiato, mocha
          background = {
            -- :h background
            light = "latte",
            dark = "mocha",
          },
          transparent_background = false,
          show_end_of_buffer = false, -- show the '~' characters after the end of buffers
          term_colors = true,
          dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.15,
          },
          no_italic = false, -- Force no italic
          no_bold = false, -- Force no bold
          styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
          },
          color_overrides = {},
          custom_highlights = {},
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = false,
            mini = true,
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
          },
        })

        -- load the colorscheme here
        -- vim.cmd.colorscheme "catppuccin"
      end
    },

    -- colorscheme onedark
    {
      'navarasu/onedark.nvim',
      lazy = true, -- make sure we load this during startup if it is your main colorscheme
      config = function()
        require("onedark").setup({
          -- Main options --
          style = 'dark',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
          transparent = false,        -- Show/hide background
          term_colors = true,         -- Change terminal color as per the selected theme style
          ending_tildes = false,      -- Show the end-of-buffer tildes. By default they are hidden
          cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

          -- toggle theme style ---
          toggle_style_key = nil,                                                            -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
          toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

          -- Change code style ---
          -- Options are italic, bold, underline, none
          -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
          code_style = {
            comments = 'italic',
            keywords = 'none',
            functions = 'none',
            strings = 'none',
            variables = 'none'
          },

          -- Lualine options --
          lualine = {
            transparent = true, -- lualine center bar transparency
          },

          -- Custom Highlights --
          colors = {},   -- Override default colors
          highlights = {}, -- Override highlight groups

          -- Plugins Config --
          diagnostics = {
            darker = true,   -- darker colors for diagnostic
            undercurl = true, -- use undercurl instead of underline for diagnostics
            background = true, -- use background color for virtual text
          },
        })
        -- load the colorscheme here
        -- vim.cmd.colorscheme "onedark"
      end
    }
