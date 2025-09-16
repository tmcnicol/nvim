local telescope = require("telescope")

local actions = require("telescope.actions")
telescope.setup({
	mappings = {
		i = {
			["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		},
		v = {
			["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		},
	},
	-- pickers = {
	-- 	find_files = {
	-- 		theme = "dropdown",
	-- 	},
	-- 	buffers = {
	-- 		theme = "dropdown",
	-- 	},
	-- 	old_files = {
	-- 		theme = "dropdown",
	-- 	},
	-- 	file_browser = {
	-- 		theme = "dropdown",
	-- 	},
	-- },
	luasnip = require("telescope.themes").get_dropdown({
		border  = false,
		preview = {
			check_mime_type = true
		},
	}),
})

telescope.load_extension("luasnip")
telescope.load_extension("git_worktree")

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>fr', builtin.resume, {}) -- resume
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("v", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fl", telescope.extensions.luasnip.luasnip)
vim.keymap.set("n", "<leader>-", telescope.extensions.file_browser.file_browser)

-- List symbols
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {desc = "list symbols"})
