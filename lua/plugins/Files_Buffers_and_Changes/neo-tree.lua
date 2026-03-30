return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			require("neo-tree").setup({
				window = {
					width = 40,
				},
				filesystem = {
					follow_current_file = { enabled = true },
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
					hijack_netrw_behavior = "open_default",
				},
				event_handlers = {
					{
						event = "file_opened",
						handler = function()
							require("neo-tree.command").execute( {action = "close"} )
						end
					}
				},
			})
		end,
	},
}
