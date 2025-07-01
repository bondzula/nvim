-- Nice diff view for staging, as well as pull requests
return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview (Diffview)" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview (Diffview)" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File History (Diffview)" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History (Diffview)" },
      { "<leader>gm", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Compare with Previous Commit (Diffview)" },
      { "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle File Panel (Diffview)" },
    },
    opts = {
      view = {
        win_config = {
          type = "split",
          position = "right",
          width = 40,
        },
        -- For more info, see ':h diffview-config-view.x.layout'.
        default = {
          layout = "diff2_horizontal",
          winbar_info = false,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },

        file_history = {
          layout = "diff2_horizontal",
          winbar_info = false,
        },
      },
    },
  },
}
