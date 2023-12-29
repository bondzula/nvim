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
      local luasnip = require("luasnip")

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
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
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("copilot.suggestion").is_visible() then
              require("copilot.suggestion").accept()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        formatting = {
          format = require("lspkind").cmp_format(),
        },
        sources = {
          {
            name = "nvim_lsp",
            entry_filter = function(entry, ctx)
              return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
            end,
          },
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
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },

  -- GitHub completion
  {
    "petertriho/cmp-git",
    ft = { "gitcommit", "octo", "NeogitCommitMessage" },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
    },
  },
}
