-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- setup for nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
	view = {
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 90,
				height = 130,
				row = 100,
				col = 200,
			},
		},
	},
	filters = {
		dotfiles = false,
	},
})

vim.keymap.set("n", "<leader>vv", ":NvimTreeToggle<CR>")
