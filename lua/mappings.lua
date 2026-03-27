local map = vim.keymap.set

-- general mappings
-- map("n", "<Leader>ne", ":Vexplore <bar> :vertical resize 30<CR>", { silent = true})
map("n", "<Leader>q", ":q<CR>", { silent = true })
map("v", "<Leader>p", '"+p', { silent = true })
map("v", "<Leader>y", '"+y', { silent = true })

map("n", "<Leader>l", "<C-w>l", { silent = true })
map("n", "<Leader>h", "<C-w>h", { silent = true })
map("n", "<Leader>j", "<C-w>j", { silent = true })
map("n", "<Leader>k", "<C-w>k", { silent = true })

vim.keymap.set("n", "<leader>da", require("dianogtics_ui").show_diagnostics, {})

-- dap mappings
local dap = require("dap")
vim.keymap.set("v", "<M-k>", ':lua require("dapui").eval()<CR>', {})

vim.keymap.set("n", "<F5>", function()
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
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

vim.keymap.set("n", "<leader>dv", function() require("dap-view").toggle() end, { desc = "Toggle DAP View" })


-- harpoon mappings
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>b", function()
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

-- lsp mappings
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Neotree mappings
vim.keymap.set(
	"n",
	"<leader>e",
	":Neotree source=filesystem toggle=true reveal=true position=left<CR>",
	{ silent = true }
)

-- nonels mappings
vim.keymap.set("n", "<leader>sf", function()
	vim.lsp.buf.format()
end, { desc = "Format file or range" })

-- telescope mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>gp", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope help tags" })

-- undotree
vim.keymap.set("n", "<C-z>", vim.cmd.UndotreeToggle)
