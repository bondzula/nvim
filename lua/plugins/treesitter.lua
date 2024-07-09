return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "comment",
        "kdl",
        "make",
        "regex",
        "sql",
        "toml",
        "xml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-Space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
