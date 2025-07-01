return {
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment (Todo Comments)" },
      {
        "[t",
        function() require("todo-comments").jump_prev() end,
        desc = "Previous todo comment (Todo Comments)",
      },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Todo Comments)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Todo Comments)" },
    },
  },
}
