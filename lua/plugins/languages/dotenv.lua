return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, options)
      local linters_by_ft = {
        dotenv = { "dotenv_linter" },
      }

      options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters_by_ft)
    end,
  },
}
