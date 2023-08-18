-- Description: Completion plugins
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-path" },

      -- { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind-nvim" },
      { "petertriho/cmp-git" },
    },
    opts = function()
      local cmp = require("cmp")

      return {
        -- snippet = {
        --   expand = function(args)
        --     require("luasnip").lsp_expand(args.body)
        --   end,
        -- },
        mapping = {
          -- Navigate through completion menu
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- Scroll docs for the currently selected item
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- Close completion menu
          ["<C-e>"] = cmp.mapping.abort(),
          -- Manually invoke completion
          ["<C-Space>"] = cmp.mapping.complete(),
          -- Confirm Completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        formatting = {
          format = require("lspkind").cmp_format(),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          -- { name = "luasnip" },
          { name = "path" },
          { name = "git" },
        },
        view = {
          entries = "native",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
      }
    end,
  },

  -- GitHub completion
  {
    "petertriho/cmp-git",
    ft = { "gitcommit", "octo", "NeogitCommitMessage" },
    dependencies = {
      { "nvim-lua/plenary.nvim" }
    },
    opts = {
      filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
    }
  },
}
