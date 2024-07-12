return {
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({
  --       keymaps = {
  --         accept_suggestion = "<M-.>",
  --         clear_suggestion = "<C-]>",
  --         accept_word = "<C-j>",
  --       },
  --       ignore_filetypes = {
  --         ["copilot-chat"] = true,
  --       },
  --     })
  --   end,
  -- },

  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      keymap = {
        accept = "<M-.>",
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      panel = { enabled = false },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = { "CopilotChatOpen", "CopilotChatToggle" },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      -- show_help = false,
    },
  },

  {
    "robitx/gp.nvim",
    keys = {
      { "<leader>ag", "<cmd>GpChatToggle popup<cr>", desc = "Toggle Chat" },
      { "<leader>ar", "<cmd>GpChatRespond<cr>", desc = "Respond" },
      { "<leader>an", "<cmd>GpChatNew popup<cr>", desc = "New Chat" },
    },
    config = function()
      require("gp").setup({
        openai_api_key = { "op", "item", "get", "ek2gd4yqjtkvs6astumllqof7u", "--fields", "label=credential" },
      })
    end,
  },
}
