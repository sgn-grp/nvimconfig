return {
	"folke/persistence.nvim",
	event = "bufreadpre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
	},
	config = function ()
		require("persistence").setup()
	end
}
