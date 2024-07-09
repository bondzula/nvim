return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- Optional, for templates (see below).
    templates = {
      folder = "99 - Meta/00 - Templates",
      date_format = "%Y%m%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    daily_notes = {
      folder = "06 - Timestamps/01 - Daily",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "DA-%Y%m%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "DA-%Y%m%d",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "(TEMPLATE) Daily.md",
    },
    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "99 - Meta/Attachments",
    },
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian Notes",
      },
    },
  },
}
