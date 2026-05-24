return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeFindPre",
      callback = function()
        if package.loaded["mini.files"] then
          MiniFiles.close()
        end
      end,
    })

    require("telescope").setup({})

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, { desc = "Search equal references" })
    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    -- vim.keymap.set('n', '<leader>ps', function()
    --   builtin.grep_string({ search = vim.fn.input("Grep > ") })
    -- end)
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Search neovim files" })
    vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Search file content" })
    vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Search buffers" })
  end,
}
