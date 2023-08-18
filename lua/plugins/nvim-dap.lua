return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint at line" },
      {
        "<leader>dus",
        function()
          local widgets = require('dap.ui.widgets');

          widgets.sidebar(widgets.scopes).open();
        end,
        "Add breakpoint at line",
      },
    },
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint at line" }
    },
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("nvim-dap").setup(opts)
    end
  }
}
