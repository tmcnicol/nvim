local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateEvents = "TextChanged,TextChangedI",
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { " « ", "NonTest" } },
			},
		},
	},
})

-- Navigate snippets
vim.keymap.set({"i", "s"}, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, {silent=true})

vim.keymap.set({"i", "s"}, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, {silent=true})

vim.keymap.set({"i", "s"}, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end, {silent=true})

-- Easy source
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/tmcnicol/snippets/*.lua", true)) do
	loadfile(ft_path)()
end

-- Load friendly snip https://github.com/rafamadriz/friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
