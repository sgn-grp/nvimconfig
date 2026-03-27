return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
			cmake = {"cmakelint"},
			cs = {"dotnet_format"}
		}
	end,
}
