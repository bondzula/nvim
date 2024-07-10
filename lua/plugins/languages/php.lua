return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "php", "phpdoc" })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_lsp_installed, { "intelephense" })
      vim.list_extend(options.ensure_tools_installed, { "phpstan", "pint" })
    end,
  },

  -- {
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   opts = function()
  --     local dap = require("dap")
  --     local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
  --     dap.adapters.php = {
  --       type = "executable",
  --       command = "node",
  --       args = { path .. "/extension/out/phpDebug.js" },
  --     }
  --   end,
  -- },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, options)
      local linters_by_ft = {
        php = { "phpstan" },
      }

      options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters_by_ft)
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters_by_ft = {
        php = { "pint" },
      }

      options.formatters_by_ft = vim.tbl_deep_extend("force", options.formatters_by_ft, formatters_by_ft)
    end,
  },
}
