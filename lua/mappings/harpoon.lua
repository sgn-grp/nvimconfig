local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function()
	local harpoond = harpoon:list()
	local file = vim.fs.basename(vim.api.nvim_buf_get_name(0))

	for i, item in ipairs(harpoond.items) do
		if vim.fs.basename(item.value) == file then
			-- harpoond:remove()					-- remove without effecting other items
			table.remove(harpoond.items, i)			-- remove and shift items to fill space
			return
		end
	end
	harpoon:list():add()
end, { desc = "Toggle Harpoon List" })
vim.keymap.set("n", "<leader>Hb", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<A-q>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<A-w>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<A-e>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<A-r>", function()
	harpoon:list():select(4)
end)
--		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
--		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
