return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "html" })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters = {
        html = { "prettierd" },
      }

      options.formatters = vim.tbl_deep_extend("force", options.formatters, formatters)
    end,
  },
}
