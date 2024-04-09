return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    keys = {
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint (DAP)",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue (DAP)",
      },
    },
    config = function()
      local present_dapui, dapui = pcall(require, "dapui")
      local present_dap, dap = pcall(require, "dap")
      local present_mason = pcall(require, "mason")
      local present_mason_dap, mason_dap = pcall(require, "mason-nvim-dap")

      if not present_dapui or not present_dap or not present_mason or not present_mason_dap then
        vim.notify("Missing dap dependencies")
        return
      end

      dapui.setup()
      mason_dap.setup({
        ensure_installed = { "python", "cppdbg", "delve", "chrome", "php", "js" },
        handlers = {},
        automatic_installation = false,
      })

      -- Automatically open UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
