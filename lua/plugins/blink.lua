return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      { "Kaiser-Yang/blink-cmp-git" },
    },
    version = "1.*",
    opts = {
      keymap = { preset = "default" },

      appearance = {
        nerd_font_variant = "mono",
      },

      snippets = { preset = "luasnip" },

      sources = {
        default = { "lsp", "snippets", "path", "buffer" },

        per_filetype = {
          gitcommit = { "git", "snippets", "path", "buffer" },
        },

        providers = {
          git = {
            module = "blink-cmp-git",
            name = "Git",
            opts = {},
          },
        },
      },

      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },

  {
    "saghen/blink.pairs",
    version = "*",
    dependencies = "saghen/blink.download",
    opts = {
      mappings = {
        enabled = true,
        disabled_filetypes = {},
        pairs = {},
      },
      highlights = {
        enabled = true,
        groups = {
          "BlinkPairsOrange",
          "BlinkPairsPurple",
          "BlinkPairsBlue",
        },
        matchparen = {
          enabled = true,
          group = "MatchParen",
        },
      },
      debug = false,
    },
  },
}
