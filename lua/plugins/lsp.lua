local on_attach = function(_, bufferNum)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufferNum, desc = "Go to Definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufferNum, desc = "Go to Declaration" })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufferNum, desc = "Go to Type Definition" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufferNum, desc = "Go to Implementation" })
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = bufferNum, desc = "Format Document" })
end

local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "LSP Info" }
    },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim",  opts = {} },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        signs = true,
        underline = true,
        virtual_text = false,
        severity_sort = true,
        update_in_insert = false,
      },
      signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }
    },
    config = function(_, opts)
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      for type, icon in pairs(opts.signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
    opts = {
      handlers = {
        -- Entry without a key will be the default handler
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,

        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                  },
                },
                format = {
                  enable = true,
                  defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                    max_line_length = "unset",
                  }
                },
                telemetry = {
                  enable = false,
                },
              }
            }
          })
        end,

        ["gopls"] = function()
          require("lspconfig").gopls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                  unusedparams = true,
                },
                hints = {
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  constantValues = true,
                  functionTypeParameters = true,
                  parameterNames = true,
                  rangeVariableTypes = true
                },
              }
            }
          })
        end

      },
      ensure_installed = {
        "ansiblels",
        "astro",
        "bashls",
        "cssls",
        -- "deno",
        "dockerls",
        "emmet_ls",
        "eslint",
        "gopls",
        "html",
        "intelephense",
        "jsonls",
        "lua_ls",
        "marksman",
        -- "nil_ls",
        "prismals",
        "pylsp",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "stylelint_lsp",
        "svelte",
        "tailwindcss",
        "terraformls",
        "volar",
      },
    },
  },

  -- Typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = on_attach,
      settings = {
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        publish_diagnostic_on = "insert_leave",
        -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
        -- (see 💅 `styled-components` support section)
        tsserver_plugins = {},
        -- described below
        tsserver_format_options = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        tsserver_file_preferences = {},
      },
    },
  }
}
