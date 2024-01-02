vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = {"*"},
	callback = function()
		local pos = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(pos)
	end,
})

