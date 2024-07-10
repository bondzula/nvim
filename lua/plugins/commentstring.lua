return {
  -- For now, batter then the built in commentary
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}
