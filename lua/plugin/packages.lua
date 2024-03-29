return {
	-- Colorscheme
	{ "savq/melange-nvim" },
	{ "rebelot/kanagawa.nvim" },

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Telescope plugins
			"benfowler/telescope-luasnip.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
	},
	{ "nvim-treesitter/playground" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "ThePrimeagen/harpoon" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-surround" },
	{ "numToStr/Comment.nvim" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-sleuth" },
	{
		"ggandor/leap.nvim",
		enabled = false,
	},
	{
		-- Trying out vim oil instead
		"tpope/vim-vinegar",
		enabled = false,
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "mbbill/undotree" },
	{ "andymass/vim-matchup" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	{ "fatih/vim-go" },

	-- Webdev things
	{ "mattn/emmet-vim" },
}
