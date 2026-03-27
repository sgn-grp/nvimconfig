local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}
local function get_diagnostics()
	local data = vim.diagnostic.get(0)
	local diag_data = {}
	for _, d in ipairs(data) do
		local entry = {}
		entry.bufnr = d.bufnr
		entry.filename = vim.api.nvim_buf_get_name(d.bufnr)
		entry.message = d.message
		entry.col = d.col
		entry.lnum = d.lnum
		table.insert(diag_data, entry)
	end
	return diag_data
end

function M.show_diagnostics()
	pickers
		.new({}, {
			prompt_title = "Diagnostics",
			finder = finders.new_table({
				results = get_diagnostics(),
				entry_maker = function(d)
					return {
						value = d,
						display = d.filename .. " -> " .. d.message,
						ordinal = d.message,
					}
				end,
			}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local d = selection.value

					if not vim.api.nvim_buf_is_valid(d.bufnr) then
						print("Error: buffer " .. d.bufnr .. " is not valid.")
						return
					end

					vim.api.nvim_win_set_buf(0, d.bufnr)
					vim.api.nvim_win_set_cursor(0, { d.lnum + 1, d.col + 1})
				end)
				return true
			end,
			sorter = conf.generic_sorter({}),
		})
		:find()
end
return M
