return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"folke/lazydev.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
	},
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = "InsertEnter",
	-- 	cmd = "Copilot",
	-- 	dependencies = {
	-- 		"zbirenbaum/copilot-cmp",
	-- 	},
	-- },
}
