return {
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>cf", '<cmd>lua require("conform").format()<cr>' },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        handlebars = { "prettier" },
        lua = { "stylua" },
        python = { "black", "ruff" },
        go = { "goimports-reviser", "gofumpt", "golines" },
        terraform = { "terraform_fmt" },
        php = { "php_cs_fixer" },
        shell = { "shfmt" },
        nix = { "nixfmt" },
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
