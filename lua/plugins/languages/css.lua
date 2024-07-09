return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "css", "scss" })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters = {
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
      }

      options.formatters = vim.tbl_deep_extend("force", options.formatters, formatters)
    end,
  },
}
