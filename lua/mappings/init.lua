-- this directory contains all the mappings in this contains
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

-- Faster resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "Increase Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "Decrease Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase Width" })

require("mappings.dap")
require("mappings.harpoon")
require("mappings.lsp")
require("mappings.neo-tree")
require("mappings.nonels")
require("mappings.telescope")
require("mappings.undotree")
