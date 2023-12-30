local on_attach = function(_, bufferNum)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufferNum, desc = "Go to Definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufferNum, desc = "Go to Declaration" })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufferNum, desc = "Go to Type Definition" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufferNum, desc = "Go to Implementation" })
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
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
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
        Error = "",
        Warn = "",
        Hint = "",
        Info = "",
      },

      servers = {
        bashls = {},
        cssls = {},
        dockerls = {},
        gopls = {
          settings = {
            gopls = {
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
        html = {},
        intelephense = {},
        jsonls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        marksman = {},
        nil_ls = {},
        pylsp = {},
        rust_analyzer = {},
        sqls = {},
        svelte = {},
        tailwindcss = {},
        terraformls = {},
        volar = {},
        yamls = {},
      },
    },
    config = function(_, opts)
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      for type, icon in pairs(opts.signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Go through the server list, and apply the setup
      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
          on_attach = on_attach,
        }, opts.servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      for server in pairs(opts.servers) do
        setup(server)
      end
    end,
  },

  -- Typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    event = { "BufReadPost", "BufNewFile" },
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
          includeInlayParameterNameHints = "all",
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
  },
}
