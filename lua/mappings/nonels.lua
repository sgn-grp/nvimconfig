vim.keymap.set("n", "<leader>sf", function()
	vim.lsp.buf.format()
end, { desc = "Format file or range" })
