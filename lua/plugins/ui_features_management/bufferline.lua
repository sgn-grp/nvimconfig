return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = require("mappings.bufferline"),
	opts = {},

	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "thick",
				indicator = {
					style = "underline",
				},
			},
		})
	end,
}
