local opts = { noremap = true, silent = true }
return {
	{ "n", "<C-w><", "<C-w><", opts },
	{ "n", "<C-w>>", "<C-w>>", opts },
	{ "n", "<C-w>+", "<C-w>+", opts },
	{ "n", "<C-w>-", "<C-w>-", opts },
	{ "n", "<C-w>_", "<C-w>_", opts },
	{ "n", "<C-w>=", "<C-w>=", opts },
	{ "n", "<C-w>|", "<C-w>|", opts },
	{ "", "<LeftRelease>", "<LeftRelease>", opts },
	{ "i", "<LeftRelease>", "<LeftRelease><C-o>", opts },
}
