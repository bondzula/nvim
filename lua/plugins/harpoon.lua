return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local status_ok, harpoon = pcall(require, "harpoon")
      if not status_ok then
        return
      end

      harpoon:setup({
        global_settings = {
          save_on_toggle = false,
          save_on_change = false,
        },
      })

      local wc_status_ok, wc = pcall(require, "which-key")
      if wc_status_ok then
        wc.register({
          h = {
            name = "Harpoon",
            a = { function() harpoon:list():append() end, "Add a new file" },
            o = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Open ui list" },

            h = { function() harpoon:list():select(1) end, "Navigate to file 1" },
            j = { function() harpoon:list():select(2) end, "Navigate to file 2" },
            k = { function() harpoon:list():select(3) end, "Navigate to file 3" },
            l = { function() harpoon:list():select(4) end, "Navigate to file 4" },

            [']'] = { function() harpoon:list():prev() end, "Navigate to previous file" },
            ['['] = { function() harpoon:list():next() end, "Navigate to next file" },
          }
        }, {
          prefix = "<leader>",
          mode = "n",
        })
      end
    end,
  },
}
