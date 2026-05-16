return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup()

		vim.keymap.set("i", "<A-f>", function()
			neocodeium.accept()
		end)
		vim.keymap.set("i", "<A-w>", function()
			neocodeium.accept_word()
		end)
		vim.keymap.set("i", "<A-l>", function()
			neocodeium.accept_line()
		end)
		vim.keymap.set("i", "<A-n>", function()
			neocodeium.cycle_or_complete()
		end)
		vim.keymap.set("i", "<A-p>", function()
			neocodeium.cycle_or_complete(-1)
		end)
		vim.keymap.set("i", "<A-x>", function()
			neocodeium.clear()
		end)
	end,
}
