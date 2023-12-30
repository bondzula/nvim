return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.5,
      },
      integrations = {
        cmp = true,
        dashboard = false,
        gitsigns = true,
        harpoon = true,
        leap = true,
        lsp_saga = true,
        lsp_trouble = true,
        markdown = true,
        mason = true,
        mini = false,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        neogit = true,
        neotree = false,
        noice = false,
        notify = false,
        octo = true,
        overseer = true,
        semantic_tokens = true,
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
}
