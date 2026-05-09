local resession = require("resession")

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function session_picker()
	local sessions = resession.list()

	pickers
		.new({}, {
			prompt_title = "Sessions",
			finder = finders.new_table({
				results = sessions,
			}),
			sorter = conf.generic_sorter({}),

			attach_mappings = function(prompt_bufnr, map)
				-- ENTER → load session
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)

					if selection then
						resession.load(selection[1])
					end
				end)

				map("i", "d", function()
					local selection = action_state.get_selected_entry()
					if selection then
						resession.delete(selection[1])

						-- refresh picker after delete
						actions.close(prompt_bufnr)
						session_picker()
					end
				end)

				map("n", "d", function()
					local selection = action_state.get_selected_entry()
					if selection then
						resession.delete(selection[1])

						actions.close(prompt_bufnr)
						session_picker()
					end
				end)

				return true
			end,
		})
		:find()
end

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local tree_wins = vim.api.nvim_list_wins()
		for _, win in ipairs(tree_wins) do
			local buf = vim.api.nvim_win_get_buf(win)
			if vim.bo[buf].filetype == "neo-tree" then
				vim.api.nvim_win_close(win, true)
			end
		end
		if resession.get_current() ~= nil then
			resession.save(resession.get_current(), { { notify = false } })
		end
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		session_picker()
	end,
	nested = true,
})

vim.api.nvim_create_autocmd("StdinReadPre", {
	callback = function()
		-- Store this for later
		vim.g.using_stdin = true
	end,
})
