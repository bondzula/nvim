return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "nix" })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "nil_ls" })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "statix", "deadnix" })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, options)
      local linters_by_ft = {
        nix = { "statix", "deadnix" },
      }

      options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters_by_ft)
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters = {
        nix = { "nixfmt" },
      }

      options.formatters = vim.tbl_deep_extend("force", options.formatters, formatters)
    end,
  },
}
