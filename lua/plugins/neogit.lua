return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  opts = {
    disable_commit_confirmation = true,
    auto_refresh = true,
    signs = {
      hunk = { "", "" },
      item = { "", "" },
      section = { "", "" },
    },
    integrations = {
      diffview = true,
    },
    disable_hint = true,
  },
  keys = {
    -- { "<leader>gc", "<cmd>lua require('neogit').open({'commit'})<CR>", desc = "[G]it [c]ommit" },
    -- { "<leader>gg", "<cmd>lua require('neogit').open()<CR>", desc = "Neo[g]it" },
  },
}
