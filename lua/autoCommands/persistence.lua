vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("persistence").select()
	end,
})
