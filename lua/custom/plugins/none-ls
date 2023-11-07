return
-- inject LSP diagnostics, code actions, and more via Lua
{
	'nvimtools/none-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = { 'mason.nvim' },
	config = function()
		local null_ls = require 'null-ls'
		local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

		null_ls.setup {
			group = augroup,
			root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile',
				'.git'),
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.autopep8,
				null_ls.builtins.diagnostics.ruff,
				null_ls.builtins.diagnostics.mypy,
			},
		}
	end,
}
