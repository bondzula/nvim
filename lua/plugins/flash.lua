return {
  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    vscode = true,
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>st", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    },
    config = function(opts)
      local flash = require("flash")
      flash.setup(opts)

      local function create_search_function(forward, wrap, multi_window)
        return function()
          flash.jump({
            search = { forward = forward, wrap = wrap, multi_window = multi_window },
          })
        end
      end

      local search_forward = create_search_function(true, false, false)
      local search_backward = create_search_function(false, false, false)
      local search_globaly = create_search_function(true, true, true)

      local function search_word_under_cursor()
        require("flash").jump({
          pattern = vim.fn.expand("<cword>"),
        })
      end

      local wc_loaded, wc = pcall(require, "which-key")

      if wc_loaded then
        wc.add({
          {
            mode = { "n" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>sf", search_forward, desc = "Search Forwards" },
            { "<leader>sb", search_backward, desc = "Search Backwards" },
            { "<leader>sg", search_globaly, desc = "Search Globaly" },
            { "<leader>sw", search_word_under_cursor, desc = "Search Word Under Cursor" },
          },
        })
      end
    end,
  },
}
