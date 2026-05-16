return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
	formatters_by_ft = {
	  -- biome handles JS/TS ecosystem; requires biome.json in project root
	  javascript = { "biome" },
	  typescript = { "biome" },
	  javascriptreact = { "biome" },
	  typescriptreact = { "biome" },
	  json = { "biome" },
	  jsonc = { "biome" },
	  -- biome does not support these filetypes
	  css = { "prettierd" },
	  html = { "prettierd" },
	  yaml = { "prettierd" },
	  markdown = { "prettierd" },
	  liquid = { "prettierd" },
	  lua = { "stylua" },
	},
	format_on_save = {
	  lsp_fallback = true,
	  async = false,
	  timeout_ms = 1000,
	},
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
	  lsp_fallback = true,
	  async = false,
	  timeout_ms = 1000,
	})
      end, { desc = "Format file or range (in visual mode)" })
    end,
  }
