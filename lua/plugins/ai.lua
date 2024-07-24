return {
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
