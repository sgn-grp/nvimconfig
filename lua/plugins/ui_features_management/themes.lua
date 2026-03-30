return {
	{ "nvim-treesitter/nvim-treesitter", build = "silent! :TSUpdate" },
	{ "projekt0n/github-nvim-theme" },
	{ "rebelot/kanagawa.nvim" },
	{ "rmehri01/onenord.nvim" },
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme github_dark_high_contrast]])
		end,
	},
}
