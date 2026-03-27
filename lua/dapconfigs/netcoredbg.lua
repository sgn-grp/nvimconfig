require("dap").adapters.coreclr = {
	type = "executable",
	command = Home .. "/.local/share/nvim/mason/bin" .. "/netcoredbg",
	args = { "--interpreter=vscode" },
}

require("dap").configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end,
		console = "integratedTerminal",
	},
}
