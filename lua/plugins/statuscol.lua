return {
  "luukvbaal/statuscol.nvim",
  opts = function()
    return {
      bt_ignore = { "nofile", "terminal" },
      segments = {
        {
          sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true },
          click = "v:lua.ScSa",
        },
        {
          sign = {
            name = { ".*" },
            text = { ".*" },
          },
          click = "v:lua.ScSa",
        },
      },
    }
  end,
}
