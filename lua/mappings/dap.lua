-- dap mappings
local dap, dapui = require("dap"), require("dapui")
vim.keymap.set("v", "<M-k>", ':lua require("dapui").eval()<CR>', {})

vim.keymap.set("n", "<F5>", function()
	vim.cmd("wall")
	dap.continue()
end)
vim.keymap.set("n", "<F10>", function()
	dap.step_over()
end)
vim.keymap.set("n", "<F11>", function()
	dap.step_into()
end)
vim.keymap.set("n", "<F12>", function()
	dap.step_out()
end)
vim.keymap.set("n", "<C-b>", function()
	dap.toggle_breakpoint()
end)
--		vim.keymap.set("n", "<Leader>lp", function()
--			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
--		end)
--		vim.keymap.set("n", "<Leader>dr", function()
--			dap.repl.open()
--		end)
--		vim.keymap.set("n", "<Leader>dl", function()
--			dap.run_last()
--		end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
--		vim.keymap.set("n", "<Leader>df", function()
--			local widgets = require("dap.ui.widgets")
--			widgets.centered_float(widgets.frames)
--		end)
--		vim.keymap.set("n", "<Leader>ds", function()
--			local widgets = require("dap.ui.widgets")
--			widgets.centered_float(widgets.scopes)
--		end)
vim.keymap.set("v", "<leader>dw", function()
	local expr = vim.fn.getreg('"')
	require("dapui").elements.watches.add(expr)
end
)
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

vim.keymap.set("n", "<leader>dv", function() require("dap-view").toggle() end, { desc = "Toggle DAP View" })

vim.keymap.set("n", "<leader>dB", function() 
	dapui.float_element("breakpoints", {
		title = "Breakpoints",
		width = 100,
		height = 20,
		enter = true,
		position = "center"
	})
end, {desc = "Open Breakpoints Floating Window"})

vim.keymap.set("n", "<leader>dC", function() 
	dapui.float_element("console", {
		title = "Console",
		width = 100,
		height = 20,
		enter = true,
		position = "center"
	})
end, {desc = "Open Console Floating Window"})

vim.keymap.set("n", "<leader>dW", function() 
	dapui.float_element("watches", {
		title = "Watch",
		width = 100,
		height = 20,
		enter = true,
		position = "center"
	})
end, {desc = "Open Watch Floating Window"})

vim.keymap.set("n", "<leader>DT", function ()
	require("osv").launch({port = 8086})
end, {desc = "launch a nvim lua debugging server"})
