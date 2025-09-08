local telescope = require("telescope")
local worktree = require("git-worktree")

worktree.setup({})

vim.keymap.set("n", "<leader>wl", telescope.extensions.git_worktree.git_worktrees, { desc = "list worktrees" })
vim.keymap.set("n", "<leader>wc", telescope.extensions.git_worktree.create_git_worktree, { desc = "create worktree" })
