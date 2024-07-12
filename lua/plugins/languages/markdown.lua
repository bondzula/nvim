return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "markdown", "markdown_inline" })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, options)
      vim.list_extend(options.ensure_lsp_installed, { "marksman", "ltex" })
      vim.list_extend(options.ensure_tools_installed, { "markdownlint-cli2", "markdown-toc" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, options)
      local servers = {
        marksman = {},
        ltex = {
          settings = {
            ltex = {
              language = "en-US",
            },
          },
          filetypes = {
            "bib",
            "gitcommit",
            "markdown",
            "org",
            "plaintex",
            "rst",
            "rnoweb",
            "tex",
            "pandoc",
            "quarto",
            "rmd",
            "NeogitCommitMessage",
          },
        },
      }

      options.servers = vim.tbl_deep_extend("force", options.servers, servers)
    end,
  },

  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    dependencies = {
      -- You may not need this if you don't lazy load
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "preservim/vim-pencil",
    ft = { "markdown", "mkd", "text" },
    init = function()
      vim.g["pencil#wrapModeDefault"] = "soft"
      vim.g["pencil#conceallevel"] = 2

      -- Create an augroup named 'pencil'
      vim.api.nvim_create_augroup("pencil", { clear = true })

      -- Define an autocommand for FileType 'markdown' and 'mkd'
      vim.api.nvim_create_autocmd("FileType", {
        group = "pencil",
        pattern = { "markdown", "mkd", "text" },
        callback = function()
          vim.fn["pencil#init"]()
        end,
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, options)
      local linters = {
        markdown = { "markdownlint-cli2" },
      }

      options.linters_by_ft = vim.tbl_deep_extend("force", options.linters_by_ft, linters)
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, options)
      local formatters = {
        ["markdown-toc"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      }

      local formatters_by_ft = {
        ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      }

      options.formatters = vim.tbl_deep_extend("force", options.formatters, formatters)
      options.formatters_by_ft = vim.tbl_deep_extend("force", options.formatters_by_ft, formatters_by_ft)
    end,
  },
}
