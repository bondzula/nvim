-- Key-bind helper
return {
  {
    "folke/which-key.nvim",
    dependencies = {
      { "echasnovski/mini.icons", version = false },
    },
    opts = {
      preset = "helix",
    },
    config = function(_, opts)
      local wk = require("which-key")

      wk.setup(opts)
      wk.add({
        {
          mode = { "n", "v" },
          { "<leader>b", group = "buffer" },
          { "<leader>c", group = "code" },
          { "<leader>f", group = "file/find" },
          { "<leader>g", group = "git" },
          { "<leader>i", group = "issues" },
          { "<leader>q", group = "quit/session" },
          { "<leader>r", group = "refactor" },
          { "<leader>t", group = "tasks" },
          { "<leader>x", group = "diagnostics/quickfix" },
          { "[", group = "prev" },
          { "]", group = "next" },
        },
      })
    end,
  },
}
