return {
	"folke/twilight.nvim",
	config = function()
		vim.keymap.set("n", "<leader>tw", ":Twilight<enter>", { desc = "Twilight toggle" })
	end,
}
