require("telescope").setup({
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		old_files = {
			theme = "dropdown",
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
-- vim.keymap.set("n", "<leader>fs", function() 
-- 	builtin.grep_string({search = vim.fn.input("Grep > ")});
-- end)	
