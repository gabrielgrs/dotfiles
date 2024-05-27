return {
  {
    "datsfilipe/min-theme.nvim",
    config = function()
      require("min-theme").setup({
        theme = "dark",
        transparent = false,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },
        overrides = {},
      })

      vim.cmd.colorscheme("min-theme")
    end,
  },
}
