-- Improved LSP UI / UX
return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    keys = {
      { "gD", "<cmd>Lspsaga preview_definition<cr>", desc = "Preview Definition" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to Definition" },
      { "gT", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Go to Type Definition" },
      { "gr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
      { "ga", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Docs" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Jump to next error" },
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Jump to previous error" },
      { "<leader>cw", "<cmd>Lspsaga lsp_finder<cr>", desc = "Lsp Finder" },
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

-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufferNum, desc = "Go to Declaration" })
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufferNum, desc = "Go to Definition" })
-- vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufferNum, desc = "Go to Type Definition" })
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufferNum, desc = "Go to Implementation" })
-- vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufferNum, desc = "Signature Help" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
