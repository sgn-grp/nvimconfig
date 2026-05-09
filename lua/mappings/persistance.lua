vim.keymap.set("n", "<leader>P", function()
	require("resession").save(vim.fn.getcwd(), { notify = false })
end, {desc = "Enable Persistence for current Directory"})
