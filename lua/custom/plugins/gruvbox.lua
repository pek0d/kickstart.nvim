return
-- theme Gruvbox
{
	'ellisonleao/gruvbox.nvim',
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
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
			invert_selection = true,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = 'soft', -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				CursorLineNr = { bold = true, fg = '#ff9900' },
				-- CursorLine = { reverse = true, bg = '#DAA520' },
				Folded = { undercurl = true, fg = '#5F9EA0', italic = false },
				FoldColumn = { fg = '#4682B4', bg = '#AFEEEE' },
				-- ColorColumn = { bg = '#4682B4' }
			},
			dim_inactive = true,
			transparent_mode = false,
		}
		-- Activate the colorscheme here
		-- vim.cmd.colorscheme 'gruvbox'
	end,
}
