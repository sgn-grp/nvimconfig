vim.keymap.set("n", "<leader>gG", function()
	Snacks.terminal({ "gitui" }, { cwd = Snacks.git.get_root() }, {
		win = {
			style = "float", -- ensure it's a float
			width = 0.9, -- 90% of screen width
			height = 0.9, -- 90% of screen height
			border = "rounded",
		},
	})
end, { desc = "GitUI (Root Dir)" })
