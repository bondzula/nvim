return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "yaml" })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "yamlls" })
    end,
  },

  -- yaml schema support
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = function(_, options)
      -- make sure mason installs the server
      local servers = {
        yamlls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              require("schemastore").yaml.schemas()
            )
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
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
      local formatters = {
        html = { "prettierd" },
      }

      options.formatters = vim.tbl_deep_extend("force", options.formatters, formatters)
    end,
  },
}
