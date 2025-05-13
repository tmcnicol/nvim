return {
	-- Colorscheme
	{ "tjdevries/colorbuddy.vim" },

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
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-surround" },
	{ "simeji/winresizer" },
	{ "numToStr/Comment.nvim" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-sleuth" },
	{ "tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-completion",
			"kristijanhusak/vim-dadbod-ui",
		},
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "mbbill/undotree" },
	{ "andymass/vim-matchup" },
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- },
	{ "fatih/vim-go" },

	-- Webdev things
	{ "mattn/emmet-vim" },
	{ "norcalli/nvim-colorizer.lua" }
}
