return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "LspAttach",
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      local nls = require("null-ls")

      -- Info diagnostic config
      local diagnosticConfig = {
        signs = true,
        underline = true,
        virtual_text = false,
        severity_sort = true,
        update_in_insert = false,
      }

      -- file types for language tool
      local ltrsFieTypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text", "NeogitCommitMessage", "octo" }

      nls.setup({
        sources = {
          -- Grammar checker
          nls.builtins.code_actions.ltrs.with({
            filetypes = ltrsFieTypes,
          }),
          nls.builtins.diagnostics.ltrs.with({
            filetypes = ltrsFieTypes,
            diagnostic_config = diagnosticConfig,
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity["INFO"]
            end,
          }),

          -- PHP
          nls.builtins.diagnostics.phpstan,

          -- Nix
          nls.builtins.formatting.nixfmt, -- Opinionated formatter
          nls.builtins.diagnostics.deadnix,
          nls.builtins.diagnostics.statix,
          nls.builtins.code_actions.statix,

          -- go
          nls.builtins.formatting.gofumpt,
          nls.builtins.formatting.goimports_reviser,
          nls.builtins.formatting.golines,
        },
      })
    end
  },
}
