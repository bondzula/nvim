return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      relative_to_current_file = false,
    },
    filetypes = {
      markdown = {
        dir_path = "99 - Meta/02 - Attachments",
        template = "![[$FILE_NAME]]", -- Obsidian-style wikilink template
      },
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
