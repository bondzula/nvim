-- Improved LSP UI / UX
return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    keys = {
      { "gr",         "<cmd>Lspsaga rename<cr>",               desc = "Rename" },
      { "ga",         "<cmd>Lspsaga code_action<cr>",          desc = "Code Action" },
      { "K",          "<cmd>Lspsaga hover_doc<cr>",            desc = "Hover Docs" },
      { "]e",         "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Jump to next error" },
      { "[e",         "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Jump to previous error" },
      { "<leader>cw", "<cmd>Lspsaga lsp_finder<cr>",           desc = "Lsp Finder" },
      { "<leader>cp", "<cmd>Lspsaga peek_definition<cr>",      desc = "Peek Definition" },
      { "<leader>co", "<cmd>Lspsaga outline<cr>",              desc = "Lsp Outline" },
    },
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
    opts = {
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
      ui = {
        title = true,
        border = "rounded",
      },
    },
  },
}
