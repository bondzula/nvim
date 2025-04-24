return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "markdown", "markdown_inline" })
    end,
  },

  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, options)
  --     vim.list_extend(options.ensure_lsp_installed, { "marksman", "ltex" })
  --     vim.list_extend(options.ensure_tools_installed, { "markdownlint-cli2" })
  --   end,
  -- },

  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, options)
  --     local servers = {
  --       marksman = {},
  --       ltex = {
  --         settings = {
  --           ltex = {
  --             language = "en-US",
  --           },
  --         },
  --         filetypes = {
  --           "bib",
  --           "gitcommit",
  --           "markdown",
  --           "org",
  --           "plaintex",
  --           "rst",
  --           "rnoweb",
  --           "tex",
  --           "pandoc",
  --           "quarto",
  --           "rmd",
  --           "NeogitCommitMessage",
  --         },
  --       },
  --     }
  --
  --     options.servers = vim.tbl_deep_extend("force", options.servers, servers)
  --   end,
  -- },

  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = function(_, options)
  --     local linters = {
  --       markdown = { "markdownlint-cli2" },
  --     }
  --
  --     options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters)
  --   end,
  -- },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      require("conform").formatters.prettier = {
        prepend_args = { "--prose-wrap", "always" },
      }

      local formatters_by_ft = {
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
      }

      options.formatters_by_ft = vim.tbl_deep_extend("force", options.formatters_by_ft, formatters_by_ft)
    end,
  },
}
