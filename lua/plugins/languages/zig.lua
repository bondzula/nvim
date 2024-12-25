return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "zig" })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_lsp_installed, { "zls" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, options)
      local servers = {
        zls = {
          settings = {
            zls = {
              enable_snippets = true,
              enable_argument_placeholders = false,
              semantic_tokens = "full",

              inlay_hints_show_variable_type_hints = false,
              inlay_hints_show_struct_literal_field_type = false,
              inlay_hints_show_parameter_name = false,
              inlay_hints_show_builtin = false,
              inlay_hints_exclude_single_argument = false,
              inlay_hints_hide_redundant_param_names = false,
              inlay_hints_hide_redundant_param_names_last_token = false,

              -- Work around editors that do not support 'source.fixall' code actions on save. This option may delivered a substandard user experience. Please refer to the installation guide to see which editors natively support code actions on save.
              force_autofix = false,

              -- Enables warnings for style guideline mismatches
              warn_style = false,

              -- Whether to highlight global var declarations
              highlight_global_var_declarations = false,

              -- Favor using `zig ast-check` instead of ZLS's fork
              prefer_ast_check_as_child_process = true,

              -- When false, the function signature of completion results is hidden. Improves readability in some editors
              completion_label_details = true,
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
