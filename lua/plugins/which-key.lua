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
          { "<leader>f", group = "file" },
          { "<leader>g", group = "git" },
          { "<leader>s", group = "snacks" },
          { "<leader>q", group = "quit/session" },
          { "<leader>t", group = "tasks" },
          { "<leader>o", group = "octo" },
          { "<leader>oi", group = "issues" },
          { "<leader>op", group = "pull requests" },
          { "<leader>u", group = "toggle" },
          { "<leader>x", group = "diagnostics/quickfix" },
        },
      })
    end,
  },
}
