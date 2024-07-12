return {
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end,
  },
}
