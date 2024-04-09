return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local present_lspconfig, lspconfig = pcall(require, "lspconfig")
    local present_mason, mason = pcall(require, "mason")
    local present_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")

    if not present_lspconfig or not present_mason or not present_mason_lspconfig then
      vim.notify("Missing mason dependencies")
      return
    end

    mason.setup({})

    local handlers = {
      function(server_name) -- default handler (optional)
        lspconfig[server_name].setup({})
      end,

      gopls = function()
        lspconfig.gopls.setup({
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
        })
      end,

      lua_ls = function()
        lspconfig.lua_ls.setup({
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
        })
      end,

      ltex = function()
        lspconfig.ltex.setup({
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
        })
      end,
    }

    mason_lspconfig.setup({
      ensure_installed = {
        "ansiblels",
        "astro",
        "bashls",
        "cssls",
        "dockerls",
        "gopls",
        "html",
        "htmx",
        "intelephense",
        "jsonls",
        "ltex",
        "lua_ls",
        "marksman",
        "nil_ls",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "stylelint_lsp",
        "tailwindcss",
        "terraformls",
        "volar",
        "yamlls",
      },
      handlers = handlers,
    })
  end,
}
