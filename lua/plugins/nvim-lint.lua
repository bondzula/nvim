return {
  {
    "mfussenegger/nvim-lint",
    event = "BufReadPost",
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
        dotenv = { "dotenv_linter" },
        json = { "jsonlint" },
        lua = { "luacheck" },
        nix = { "statix", "deadnix" },
        php = { "phpstan" },
        terraform = { "terraform_validate" },
        tf = { "terraform_validate" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        tsx = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
      },
    },
    config = function(_, opts)
      require("lint").linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      vim.api.nvim_create_autocmd({ "BufReadPost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
