return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup({
				ensure_installed = { "bash-debug-adapter" },
			})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "neocmake", "bashls" },
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp_configs.lua-ls_config")
			require("lsp_configs.roslyn-csharp-config")
			require("lsp_configs.neocmake")
			vim.lsp.config("clangd", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
			vim.lsp.config("bashls", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			vim.lsp.enable("clangd")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("cmake")
			vim.lsp.enable("bashls")
			vim.lsp.enable("roslyn")
		end,
	},
}
