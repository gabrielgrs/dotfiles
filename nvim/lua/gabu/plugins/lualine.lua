return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local mocha = {
			base = "#1e1e2e",
			mantle = "#181825",
			surface0 = "#313244",
			surface1 = "#45475a",
			surface2 = "#585b70",
			overlay1 = "#7f849c",
			text = "#cdd6f4",
			subtext1 = "#bac2de",
			lavender = "#b4befe",
			blue = "#89b4fa",
			mauve = "#cba6f7",
			pink = "#f5c2e7",
			red = "#f38ba8",
			peach = "#fab387",
			yellow = "#f9e2af",
			green = "#a6e3a1",
			teal = "#94e2d5",
		}

		local custom_theme = {
			normal = {
				a = { fg = mocha.base, bg = mocha.blue, gui = "bold" },
				b = { fg = mocha.text, bg = mocha.surface1 },
				c = { fg = mocha.subtext1, bg = mocha.mantle },
			},
			insert = {
				a = { fg = mocha.base, bg = mocha.green, gui = "bold" },
				b = { fg = mocha.text, bg = mocha.surface1 },
			},
			visual = {
				a = { fg = mocha.base, bg = mocha.mauve, gui = "bold" },
				b = { fg = mocha.text, bg = mocha.surface1 },
			},
			replace = {
				a = { fg = mocha.base, bg = mocha.red, gui = "bold" },
				b = { fg = mocha.text, bg = mocha.surface1 },
			},
			command = {
				a = { fg = mocha.base, bg = mocha.peach, gui = "bold" },
				b = { fg = mocha.text, bg = mocha.surface1 },
			},
			inactive = {
				a = { fg = mocha.overlay1, bg = mocha.mantle },
				b = { fg = mocha.overlay1, bg = mocha.mantle },
				c = { fg = mocha.overlay1, bg = mocha.mantle },
			},
		}

		require("lualine").setup({
			options = {
				theme = custom_theme,
			},
		})
	end,
}
