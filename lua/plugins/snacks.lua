return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      animate = { enabled = true, fps = 120 },
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      image = { enabled = true },
      indent = { enabled = false },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      lazygit = {
        enabled = true,
        configure = true,
      },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      dim = { enabled = false },
      picker = {
        hidden = true,
        ignored = true,
        sources = {
          explorer = {
            layout = {
              layout = {
                position = "right",
              },
            },
          },
        },
      },
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files (Snacks)" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers (Snacks)" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep (Snacks)" },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History (Snacks)" },
      { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History (Snacks)" },
      { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer (Snacks)" },
      -- Files
      { "<leader>fR", function() Snacks.rename.rename_file() end, desc = "Rename File (Snacks)" },
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects (Snacks)" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent (Snacks)" },
      -- search
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics (Snacks)" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics (Snacks)" },
      { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume (Snacks)" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes (Snacks)" },
      -- Old
      { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer (Snacks)" },
      { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer (Snacks)" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer (Snacks)" },
      { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Browse (Snacks)", mode = { "n", "v" } },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications (Snacks)" },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
        end,
      })
    end,
  },
}
