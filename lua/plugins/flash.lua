return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
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
        wc.register({
          s = {
            name = "Search",
            f = { search_forward, "Search Forwards" },
            b = { search_backward, "Search Backwards" },
            g = { search_globaly, "Search Globaly" },
            w = { search_word_under_cursor, "Search Word Under Cursor" },
          },
        }, { mode = "n", prefix = "<leader>" })
      end
    end,
  },
}
