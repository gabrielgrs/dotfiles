return {
	"sindrets/diffview.nvim",
	requires = "nvim-lua/plenary.nvim",
	config = function()
		local cb = require("diffview.config").diffview_callback

		require("diffview").setup({
			diff_binaries = false, -- Show diffs for binaries
			enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
			use_icons = true,      -- Requires nvim-web-devicons
			icons = {              -- Only applies when use_icons is true.
				folder_closed = "",
				folder_open = "",
			},
			signs = {
				fold_closed = "",
				fold_open = "",
				done = "✓",
			},
			view = {
				-- Configure the layout and other options
				default = {
					layout = "diff2_horizontal", -- options: diff1_plain, diff2_horizontal, diff2_vertical, diff3_horizontal, diff3_vertical, diff4_mixed
					winbar_info = false,    -- See ':h diffview-config-view.x.winbar_info'
				},
				merge_tool = {
					layout = "diff3_mixed",
					disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers
				},
			},
			file_panel = {
				win_config = {
					position = "left", -- One of 'left', 'right', 'top', 'bottom'
					width = 35,   -- Only applies when position is 'left' or 'right'
					height = 10,  -- Only applies when position is 'top' or 'bottom'
				},
			},
			keymaps = {
				disable_defaults = false,            -- Disable the default keymaps
				view = {
					["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
					["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
					["gf"] = cb("goto_file"),          -- Open the file in a new split in the previous tabpage
					["<C-w><C-f>"] = cb("goto_file_split"), -- Open the file in a new split
					["<C-w>gf"] = cb("goto_file_tab"), -- Open the file in a new tabpage
					["<leader>e"] = cb("focus_files"), -- Bring focus to the file panel
					["<leader>b"] = cb("toggle_files"), -- Toggle the file panel.
				},
				file_panel = {
					["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
					["<down>"] = cb("next_entry"),
					["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
					["<up>"] = cb("prev_entry"),
					["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
					["o"] = cb("select_entry"),
					["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
					["<tab>"] = cb("select_next_entry"),
					["<s-tab>"] = cb("select_prev_entry"),
					["gf"] = cb("goto_file"),
					["<C-w><C-f>"] = cb("goto_file_split"),
					["<C-w>gf"] = cb("goto_file_tab"),
					["i"] = cb("listing_style"),  -- Toggle between 'list' and 'tree' views
					["f"] = cb("toggle_flatten_dirs"), -- Flatten empty subdirectories in tree listing style.
					["<leader>e"] = cb("focus_files"),
					["<leader>b"] = cb("toggle_files"),
				},
				file_history_panel = {
					["g!"] = cb("options"),        -- Open the option panel
					["<C-d>"] = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
					["zR"] = cb("open_all_folds"),
					["zM"] = cb("close_all_folds"),
					["j"] = cb("next_entry"),
					["<down>"] = cb("next_entry"),
					["k"] = cb("prev_entry"),
					["<up>"] = cb("prev_entry"),
					["<cr>"] = cb("select_entry"),
					["o"] = cb("select_entry"),
					["<2-LeftMouse>"] = cb("select_entry"),
					["<tab>"] = cb("select_next_entry"),
					["<s-tab>"] = cb("select_prev_entry"),
					["gf"] = cb("goto_file"),
					["<C-w><C-f>"] = cb("goto_file_split"),
					["<C-w>gf"] = cb("goto_file_tab"),
					["<leader>e"] = cb("focus_files"),
					["<leader>b"] = cb("toggle_files"),
				},
				option_panel = {
					["<tab>"] = cb("select"),
					["q"] = cb("close"),
				},
			},
		})

		vim.api.nvim_set_keymap(
			"n",
			"<leader>do",
			":DiffviewOpen<CR>",
			{ noremap = true, silent = true, desc = "Diffview Open" }
		)
	end,
}
