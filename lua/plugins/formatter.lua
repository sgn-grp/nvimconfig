return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local Home = os.getenv("HOME")
		require("conform").setup({
			formatters_by_ft = {
				python = { "isort", "black" },
				lua = { "stylua" },
				cs = { "csharpier" },
			},
		})
	end,
}
