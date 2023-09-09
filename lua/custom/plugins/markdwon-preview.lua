return
-- markdown preview old
-- -- to install run in vim :call mkdp#util#install()
{
	'iamcco/markdown-preview.nvim',
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	-- run = 'cd app && npm install',
	init = function()
		vim.g.mkdp_filetypes = { 'markdown' }
	end,
	ft = { 'markdown' },
}
