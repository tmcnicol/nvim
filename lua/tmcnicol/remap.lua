vim.g.mapleader = " "

-- Visually move lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Put cursor at the start of the line when joining
vim.keymap.set("n", "J", "mzJ`z")

-- Paste over without replacing buffer
vim.keymap.set("n", "<leader>p", "\"+_dP")

-- Copy to the clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to a void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Run tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww session<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


-- Searching
vim.keymap.set("c", "<C-g>", "\\(\\)<Left><Left>") -- add search groups

-- Search for visual selection
-- https://www.reddit.com/r/neovim/comments/vu9atg/how_do_i_get_the_text_selected_in_visual_mode/
-- local function get_visual()
-- 	local vstart = vim.fn.getpos("'<")
-- 	local line_start = vstart[2]
-- 	local col_start = vstart[3]
--
-- 	print(line_start, col_start)
-- end
--
-- vim.keymap.set("v", "//", get_visual)

-- Make vim a little more emacs-y
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("c", "<C-b>", "<Left>")
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<M-b>", "<S-Left>")
vim.keymap.set("c", "<M-f>", "<S-Right>")

-- Quickfix lists
vim.keymap.set("n", "<C-k>", "<cmd>:cprev<CR>zz", { desc = "quickfix: prev" })
vim.keymap.set("n", "<C-j>", "<cmd>:cnext<CR>zz", { desc = "quickfix: next" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

local qflist_open = false
local function toggleQFList()
	if qflist_open then
		vim.cmd "cclose"
		qflist_open = false
	else
		vim.cmd "botright copen"
		qflist_open = true
	end
end

vim.keymap.set("n", "<C-q>", toggleQFList)
