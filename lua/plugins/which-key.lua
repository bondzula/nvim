-- Key-bind helper
return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      wk.setup()
      wk.register({
        mode = { "n", "v" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>r"] = { name = "+refactor" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>i"] = { name = "+issues" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>t"] = { name = "+tasks" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      })
    end,
  },
}
