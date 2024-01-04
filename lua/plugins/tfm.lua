return {
  {
    "rolv-apneseth/tfm.nvim",
    lazy = false,
    opts = {
      file_manager = "yazi",
    },
    keys = {
      {
        "<leader>e",
        function()
          require("tfm").open(vim.fn.expand("%:p:h"), nil)
        end,
        desc = "TFM",
      },
    },
  },
}
