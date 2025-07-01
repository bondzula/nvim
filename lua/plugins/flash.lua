return {
  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    vscode = true,
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash (Flash)" },
      {
        "S",
        mode = { "n", "x", "o" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter (Flash)",
      },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash (Flash)" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search (Flash)",
      },
    },
  },
}
