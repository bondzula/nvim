return {
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    opts = {
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
      },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
        },
      },
      provider_selector = function(_, ft, _)
        -- local lspWithOutFolding = { "markdown", "zsh", "css", "html", "python", "json", "vue" }
        -- if vim.tbl_contains(lspWithOutFolding, ft) then
        --   return { "treesitter", "indent" }
        -- end
        return { "lsp", "indent" }
      end,
    },
    config = function(_, opts)
      require("ufo").setup(opts)

      vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds (UFO)" })
      vim.keymap.set("n", "zm", require("ufo").closeAllFolds, { desc = "Close All Folds (UFO)" })
      vim.keymap.set("n", "zK", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek folds (UFO)" })

      vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "NeogitStatus", "neo-tree" },
        callback = function()
          print("Detaching UFO for " .. vim.bo.filetype)
          require("ufo").detach()
          vim.opt_local.foldenable = false
          vim.opt_local.foldcolumn = "0"
        end,
      })
    end,
  },
}
