return {
  {
    "stevearc/conform.nvim",
    event = "BufReadPost",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true }, function(err, did_edit)
            if not err and did_edit then vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" }) end
          end)
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        -- CSS
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        -- HTML
        html = { "prettierd" },
        -- JS / TS
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        -- Go
        go = { "goimports-reviser", "gofumpt", "golines" },
        -- Lua
        lua = { "stylua" },
        -- Nix
        nix = { "nixfmt" },
        -- PHP
        php = { "pint", "php_cs_fixer", stop_after_first = true },
        -- Python
        python = { "black", "ruff", stop_after_first = true },
        -- Terraform
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        -- Shell
        shell = { "shfmt" },
        bash = { "shfmt" },

        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
    },
    init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
  },
}
