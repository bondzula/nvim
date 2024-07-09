return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "terraform", "hcl" })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "terraformls" })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "tflint" })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, options)
      local linters_by_ft = {
        terraform = { "terraform_validate" },
        tf = { "terraform_validate" },
      }

      options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters_by_ft)
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters_by_ft = {
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      }

      options.formatters_by_ft = vim.tbl_deep_extend("force", options.formatters_by_ft, formatters_by_ft)
    end,
  },
}
