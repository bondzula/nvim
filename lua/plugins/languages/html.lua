return {
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
