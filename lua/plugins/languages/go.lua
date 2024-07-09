return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "go", "gomod", "gowork", "gosum" })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "gopls" })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "goimports-reviser", "gofumpt", "golines" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, options)
      local servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      }

      options.servers = vim.tbl_deep_extend("force", options.servers, servers)
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters_by_ft = {
        go = { "goimports-reviser", "gofumpt", "golines" },
      }

      options.formatters_by_ft = vim.tbl_deep_extend("force", options.formatters_by_ft, formatters_by_ft)
    end,
  },

  -- {
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   dependencies = {
  --     {
  --       "williamboman/mason.nvim",
  --       opts = { ensure_installed = { "delve" } },
  --     },
  --     {
  --       "leoluz/nvim-dap-go",
  --       opts = {},
  --     },
  --   },
  -- },
  --
  -- {
  --   "nvim-neotest/neotest",
  --   optional = true,
  --   dependencies = {
  --     "fredrikaverpil/neotest-golang",
  --   },
  --   opts = {
  --     adapters = {
  --       ["neotest-golang"] = {
  --         -- Here we can set options for neotest-golang, e.g.
  --         -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
  --         dap_go_enabled = true, -- requires leoluz/nvim-dap-go
  --       },
  --     },
  --   },
  -- },
}
