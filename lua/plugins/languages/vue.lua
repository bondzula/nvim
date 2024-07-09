return {
  -- depends on the typescript extra
  -- { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "vue" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, options)
      local servers = {
        volar = {
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
        vtsls = {},
      }

      options.servers = vim.tbl_deep_extend("force", options.servers, servers)
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, options)
      local linters_by_ft = {
        vue = { "eslint_d" },
      }

      options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters_by_ft)
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters = {
        vue = { "prettierd" },
      }

      options.formatters = vim.tbl_deep_extend("force", options.formatters, formatters)
    end,
  },
  -- Configure tsserver plugin
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     table.insert(opts.servers.vtsls.filetypes, "vue")
  --     LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
  --       {
  --         name = "@vue/typescript-plugin",
  --         location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
  --         languages = { "vue" },
  --         configNamespace = "typescript",
  --         enableForWorkspaceTypeScriptVersions = true,
  --       },
  --     })
  --   end,
  -- },
}
