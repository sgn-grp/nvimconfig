-- nvim settings
vim.cmd("set number")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.relativenumber = true
vim.o.updatetime = 300

-- vim.cmd("set clipboard=unnamedplus")

-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 4

-- loading lazy and all the pulgins
require("config.lazy")
require("mappings")
require("autoCommands")

-- functionality

