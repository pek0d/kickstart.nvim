-- bufferline
return {
	'akinsho/bufferline.nvim',
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('bufferline').setup {
			options = {
				hover = {
					enabled = true,
					delay = 150,
					reveal = { 'close' },
				},
			},
		}
	end,
}
