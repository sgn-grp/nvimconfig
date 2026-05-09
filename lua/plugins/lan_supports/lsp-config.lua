local installList = {}
if LAN_CMAKE then table.insert(installList, "neocmake") end
if LAN_BASH then table.insert(installList, "bashls") end
if LAN_LUA then table.insert(installList, "lua_ls") end
if LAN_CCPP then table.insert(installList, "clangd") end

return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = installList,
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			if LAN_LUA then require("lsp_configs.lua-ls_config") end
			if LAN_CSHARP then require("lsp_configs.roslyn-csharp-config") end
			if LAN_CMAKE then require("lsp_configs.neocmake") end
			if LAN_CCPP then vim.lsp.config("clangd", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			}) end
			if LAN_BASH then vim.lsp.config("bashls", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			}) end

			if LAN_CCPP then vim.lsp.enable("clangd") end
			if LAN_LUA then vim.lsp.enable("lua_ls") end
			if LAN_CMAKE then vim.lsp.enable("cmake") end
			if LAN_BASH then vim.lsp.enable("bashls") end
			if LAN_CSHARP then vim.lsp.enable("roslyn") end
		end,
	},
}
