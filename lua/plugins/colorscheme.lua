return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.5,
      },
      integrations = {
        alpha = true,
        dap = true,
        dap_ui = true,
        dashboard = false,
        diffview = true,
        flash = true,
        gitsigns = true,
        harpoon = true,
        lsp_trouble = true,
        markdown = true,
        blink_cmp = {
          style = "bordered",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        fidget = true,
        neogit = true,
        neotree = true,
        neotest = true,
        noice = false,
        notify = false,
        octo = true,
        overseer = true,
        semantic_tokens = true,
        snacks = true,
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        treesitter = true,
        ufo = true,
        which_key = true,
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
    },
  },
}
