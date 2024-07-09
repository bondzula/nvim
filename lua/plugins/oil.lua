return {
  "stevearc/oil.nvim",
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Oil",
  keys = {
    -- Open the file explorer
    -- stylua: ignore
    { "<leader>fo", "<cmd>Oil<cr>", desc = "Open Oil.nvim" },
  },
  opts = {
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = true,
    -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
    skip_confirm_for_simple_edits = true,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    float = {
      -- Padding around the floating window
      padding = 2,
      max_width = 90,
      max_height = 0,
      -- border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
  },
}
