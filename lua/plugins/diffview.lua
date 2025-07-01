-- Nice diff view for staging, as well as pull requests
return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
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
