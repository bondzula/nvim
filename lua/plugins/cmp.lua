-- Description: Completion plugins
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-path" },
      { "lukas-reineke/cmp-under-comparator" },

      { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind-nvim" },
    },
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local suggestion = require("supermaven-nvim.completion_preview")

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
              cmp.confirm({ select = true })
            elseif suggestion.has_suggestion() then
              suggestion.on_accept_suggestion()
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
            if luasnip.jumpable(-1) then
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
          { name = "luasnip" },
          {
            name = "nvim_lsp",
            entry_filter = function(entry)
              return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
            end,
          },
          { name = "nvim_lsp_signature_help" },
          { name = "path" },
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
          },
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
}
