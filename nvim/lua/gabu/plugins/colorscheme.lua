return {
  {
    "datsfilipe/min-theme.nvim",
    config = function()
      require("min-theme").setup({
        theme = "dark",
        transparent = false,
        italics = {
          comments = true,
          keywords = false,
          functions = false,
          strings = false,
          variables = false,
        },
        overrides = {},
      })

      vim.cmd.colorscheme("min-theme")

      local function no_bold()
        for name, hl in pairs(vim.api.nvim_get_hl(0, {})) do
          local italic = hl.italic and not name:find("Comment")
          if (hl.bold or italic) and not hl.link then
            hl.bold = false
            if italic then hl.italic = false end
            vim.api.nvim_set_hl(0, name, hl)
          end
        end
      end
      no_bold()
      vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, { callback = no_bold })
    end,
  },
}
