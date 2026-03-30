return {
	"kwkarlwang/bufresize.nvim",
	config = function()
		local opts = { noremap = true, silent = true }		-- NOTE: any changes to this table must be updated in mappings/bufferResize.lua also
		require("bufresize").setup({
			register = {
				keys = require("mappings.bufferResize"),
				trigger_events = { "BufWinEnter", "WinEnter" },
			},
			resize = {
				keys = {},
				trigger_events = { "VimResized" },
				increment = 10,
			},
		})
	end,
}
