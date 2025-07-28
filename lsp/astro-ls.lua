local blink = require("blink.cmp")

return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = {
    typescript = {},
  },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    blink.get_lsp_capabilities()
  ),
}
