-- lsp servers are installed in lua/lan_supports/lsp-config.lua file
local installList = {"gitui"}
if LAN_BASH then table.insert(installList, "bash-debug-adapter")
	table.insert(installList, "shfmt")
end
if LAN_CMAKE then table.insert(installList, "cmakelint") end
if LAN_CSHARP then table.insert(installList, "netcoredbg")
	table.insert(installList, "roslyn") end
if LAN_LUA then table.insert(installList, "stylua") end

return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = installList,
			})
		end,
	},
}
