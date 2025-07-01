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

        local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc }) end

        -- Navigation
        map({ "n", "v" }, "]h", gs.next_hunk, "Goto next [h]unk (Gitsigns)")
        map({ "n", "v" }, "[h", gs.prev_hunk, "Goto previous [h]unk (Gitsigns)")

        -- Staging and resetting
        map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "[G]it [S]tage hunk (Gitsigns)")
        map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "[G]it [R]eset hunk (Gitsigns)")
        map("n", "<leader>gS", gs.stage_buffer, "[G]it [S]tage buffer (Gitsigns)")
        map("n", "<leader>gu", gs.undo_stage_hunk, "[G]it [U]ndo stage hunk (Gitsigns)")
        map("n", "<leader>gR", gs.reset_buffer, "[G]it [R]eset buffer (Gitsigns)")

        -- Viewing changes
        map("n", "<leader>gk", gs.preview_hunk, "[G]it Preview hun[K] (Gitsigns)")
        map("n", "<leader>gd", gs.diffthis, "[G]it [D]iff this (Gitsigns)")

        -- Toggles
        map("n", "<leader>tb", gs.toggle_current_line_blame, "[T]oggle Git [B]lame (Gitsigns)")
        map("n", "<leader>td", gs.toggle_deleted, "[T]oggle [D]eleted lines (Gitsigns)")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk (Gitsigns)")
      end,
    },
  },
}
