return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "dockerfile" })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "dockerls", "docker_compose_language_service" })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "hadolint" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, options)
      local servers = {
        dockerls = {},
        docker_compose_language_service = {},
      }

      options.servers = vim.tbl_deep_extend("force", options.servers, servers)
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, options)
      local linters = {
        dockerfile = { "hadolint" },
      }

      options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters)
    end,
  },
}
