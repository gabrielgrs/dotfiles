return {
  "echasnovski/mini.files",
  version = false,
  lazy = false,
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 40,
    },
    options = {
      use_as_default_explorer = true,
    },
    mappings = {
      go_in_plus = "<CR>",
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end
      end,
      desc = "Toggle file explorer",
    },
    {
      "<leader>pe",
      function()
        MiniFiles.open()
      end,
      desc = "Open file explorer (cwd)",
    },
  },
}
