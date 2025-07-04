return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "simple",
        options = {
          use_icons_from_diagnostic = true,
          throttle = 100,
        },
      })
    end,
  },
}
