return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local function get_file_name()
        return vim.api.nvim_buf_get_name(0)
      end

      require("lint").linters.deadnix = {
        name = "deadnix",
        cmd = "deadnix",
        stdin = true,
        args = { "-o", "json", get_file_name },
        ignore_exitcode = true,
        parser = function(output, bufnr)
          if output == "" then
            return {}
          end
          local decoded = vim.json.decode(output)
          if decoded == nil then
            return {}
          end
          local diagnostics = {}
          local current_file = vim.api.nvim_buf_get_name(bufnr)

          if current_file == decoded.file then
            for _, item in ipairs(decoded.results) do
              table.insert(diagnostics, {
                lnum = item.line - 1,
                end_lnum = item.line - 1,
                col = item.column - 1,
                end_col = item.endColumn,
                severity = vim.diagnostic.severity.WARN,
                source = "deadnix",
                message = item.message,
              })
            end
          end

          return diagnostics
        end,
      }

      require("lint").linters_by_ft = {
        dockerfile = { "hadolint" },
        dotenv = { "dotenv_linter" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        json = { "jsonlint" },
        nix = { "statix", "deadnix" },
        php = { "phpstan" },
        tsx = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
      }

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
