return
-- markdown preview
{
	'iamcco/markdown-preview.nvim',
	lazy = false,
	run = 'cd app && npm install',
	setup = function()
		vim.g.mkdp_filetypes = { 'markdown' }
	end,
	ft = { 'markdown' },
}
