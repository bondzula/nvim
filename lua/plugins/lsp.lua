local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

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
        yamlls = {},
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
      settings = {
        expose_as_code_action = "all",
      },
    },
  },
}
