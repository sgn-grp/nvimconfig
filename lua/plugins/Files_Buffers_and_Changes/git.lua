return {
	"NeogitOrg/neogit",
lazy = true,
dependencies = {
	"nvim-lua/plenary.nvim",         -- required

    "sindrets/diffview.nvim",

    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = require("mappings.neogit")
  }
