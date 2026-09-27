return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- main branch doesn't support lazy-loading
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- main branch: setup() ignores ensure_installed, parsers go through install()
		require("nvim-treesitter").install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
		})

		-- main branch doesn't enable highlighting by itself
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})

		require("nvim-ts-autotag").setup()
	end,
}
