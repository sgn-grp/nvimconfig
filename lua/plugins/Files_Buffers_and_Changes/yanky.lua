return {
	"gbprod/yanky.nvim",
	dependencies = {
		{ "kkharji/sqlite.lua" },
	},
	opts = {
		ring = { storage = "sqlite" },
	},
	keys = require("mappings.yank-and-put"),
	config = function ()
		require("yanky").setup({
			system_clipboard = {
				sync_with_ring = true,
			}
		})
	end
}
