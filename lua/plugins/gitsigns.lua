-- Nice gutter signt, plus buffer commands for working with changes
return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Navigation
        map("n", "]h", gs.next_hunk, "Goto next [h]unk")
        map("n", "[h", gs.prev_hunk, "Goto previous [h]unk")

        -- Staging and resetting
        map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "[G]it [S]tage hunk")
        map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "[G]it [R]eset hunk")
        map("n", "<leader>gS", gs.stage_buffer, "[G]it [S]tage buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "[G]it [U]ndo stage hunk")
        map("n", "<leader>gR", gs.reset_buffer, "[G]it [R]eset buffer")

        -- Viewing changes
        map("n", "<leader>gk", gs.preview_hunk, "[G]it Preview hun[K]")
        map("n", "<leader>gd", gs.diffthis, "[G]it [D]iff this")

        -- Toggles
        map("n", "<leader>tb", gs.toggle_current_line_blame, "[T]oggle Git [B]lame")
        map("n", "<leader>td", gs.toggle_deleted, "[T]oggle [D]eleted lines")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}
