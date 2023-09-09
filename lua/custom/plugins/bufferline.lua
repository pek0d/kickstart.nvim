---@diagnostic disable: missing-fields
return
-- bufferline
{
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function(_, opts)
		require("bufferline").setup {
			options = {
				hover = {
					enabled = true,
					delay = 150,
					reveal = { 'close' }
				}
			}
		}
	end
}
