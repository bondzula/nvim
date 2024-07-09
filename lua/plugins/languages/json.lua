return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "jsonlint" })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, options)
      local linters_by_ft = {
        json = { "jsonlint" },
      }

      options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters_by_ft)
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters = {
        json = { "prettierd" },
        jsonc = { "prettierd" },
      }

      options.formatters = vim.tbl_deep_extend("force", options.formatters, formatters)
    end,
  },
}
