return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    view = {
      width = 35,
    },
    renderer = {
      group_empty = true,
      indent_markers = { enable = true },
    },
    filters = {
      dotfiles = false,
    },
    git = {
      enable = true,
    },
    actions = {
      open_file = {
        quit_on_open = false,
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    { "<leader>pe", "<cmd>NvimTreeFindFile<cr>", desc = "Reveal current file" },
  },
}
