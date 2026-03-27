return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({ "c", "cpp", "lua", "cmake", "bash", "c_sharp" })
	end,
}
