vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local tree_wins = vim.api.nvim_list_wins()
		for _, win in ipairs(tree_wins) do
			local buf = vim.api.nvim_win_get_buf(win)
			if vim.bo[buf].filetype == "neo-tree" then
				vim.api.nvim_win_close(win, true)
			end
		end
	end,
})
