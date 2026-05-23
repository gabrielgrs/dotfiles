return {
  "echasnovski/mini.files",
  version = "*",
  dependencies = { "echasnovski/mini.icons" },
  lazy = false,
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
          vim.cmd("bwipeout 1")
          require("mini.files").open(arg, true)
        end
      end,
    })
  end,
  keys = {
    {
      "<leader>pe",
      function()
        local MiniFiles = require("mini.files")
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
        end
      end,
      desc = "Open mini.files (current file)",
    },
  },
  config = function()
    local MiniFiles = require("mini.files")
    MiniFiles.setup({
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 50,
      },
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        vim.keymap.set("n", "<CR>", function()
          MiniFiles.go_in({ close_on_file = true })
        end, { buffer = args.data.buf_id, desc = "Open file" })
      end,
    })
  end,
}
