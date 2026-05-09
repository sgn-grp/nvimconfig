local home = os.getenv("HOME")
require("dap").adapters.coreclr = {
	type = "executable",

	command = home .. "/.local/share/nvim/mason/bin" .. "/netcoredbg",
	args = { "--interpreter=vscode" },
}

require("dap").configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			os.execute("dotnet build")
			return vim.fn.glob(vim.fn.getcwd() .. "/bin/Debug/**/*.dll")
		end,
		console = "integratedTerminal",
	},
}
