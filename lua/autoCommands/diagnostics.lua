vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
				return -- A floating window (like LSP hover) is open, so do nothing
			end
		end
		vim.diagnostic.open_float(nil, {
			focusable = false,
			border = "rounded",
			source = "always",
		})
	end,
})
