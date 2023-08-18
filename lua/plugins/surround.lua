-- TODO: document and write flash card for those keybinds
return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end
  },
}
