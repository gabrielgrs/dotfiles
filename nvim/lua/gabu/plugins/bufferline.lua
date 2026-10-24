return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			offsets = { { filetype = "NvimTree", text = "Explorer", separator = true } },
			diagnostics = "nvim_lsp",
		},
	},
	keys = {
		{ "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
		{ "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
		{ "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete buffer" },
	},
}
