local home = os.getenv("HOME")
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local sourcesList = {}
		if LAN_LUA then
			table.insert(sourcesList, null_ls.builtins.formatting.stylua)
			table.insert(sourcesList, null_ls.builtins.formatting.stylua)
		end
		if LAN_CMAKE then
			table.insert(
				sourcesList,
				null_ls.builtins.diagnostics.cmake_lint.with({
					command = home .. "/.local/share/nvim/mason/bin/cmakelint",
				})
			)
		end
		if LAN_PYTHON then
			table.insert(sourcesList, null_ls.builtins.diagnostics.mypy)
		end
		if LAN_CCPP then
			table.insert(sourcesList, null_ls.builtins.diagnostics.clazy)
		end

		null_ls.setup({
			sources = sourcesList,
		})
	end,
}
