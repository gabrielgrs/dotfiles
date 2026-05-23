return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    { "<leader>pe", "<cmd>Neotree toggle reveal<CR>", desc = "Toggle file tree" },
    { "<leader>pE", "<cmd>Neotree focus<CR>",         desc = "Focus file tree" },
    {
      "<leader>e",
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("wincmd p")
        else
          vim.cmd("Neotree focus reveal")
        end
      end,
      desc = "Toggle focus between buffer and file tree",
    },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      width = 32,
      mappings = {
        ["<space>"] = "none",
      },
    },
    default_component_configs = {
      indent = { with_markers = true },
      git_status = {
        symbols = {
          added = "+",
          modified = "~",
          deleted = "-",
          renamed = "→",
          untracked = "?",
          ignored = "i",
          unstaged = "U",
          staged = "S",
          conflict = "C",
        },
      },
    },
  },
}
