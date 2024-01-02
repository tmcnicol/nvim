return {
	-- Colorscheme
	{ "savq/melange-nvim" },
	{ "rebelot/kanagawa.nvim" },

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
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
	{ "tpope/vim-vinegar" },
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