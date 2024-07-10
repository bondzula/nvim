-- Description: Autocomplete plugin for nvim-cmp
return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<M-.>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
      })
    end,
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   build = ":Copilot auth",
  --   event = "InsertEnter",
  --   opts = {
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = true,
  --     },
  --     panel = { enabled = false },
  --   },
  -- },
}
