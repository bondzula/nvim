return {
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>cf", '<cmd>lua require("conform").format()<cr>', desc = "[C]ode [F]ormat" },
    },
    opts = {
      formatters = {},
      formatters_by_ft = {
        shell = { "shfmt" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
    },
    format_on_save = {
      timeout_ms = 300,
      lsp_fallback = true,
    },
    config = function(_, opts)
      require("conform").setup(opts)

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })

      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
