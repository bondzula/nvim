return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("octo").setup({
      enable_builtin = true,
      mappings = {
        review_diff = {
          select_next_entry = { lhs = "<Tab>", desc = "move to previous changed file" },
          select_prev_entry = { lhs = "<S-Tab>", desc = "move to next changed file" },
        },
      },
    })
    vim.treesitter.language.register("markdown", "octo")
  end,
  keys = {
    -- { "<leader>o", "<cmd>Octo<cr>", desc = "Open Octo" },
    { "<leader>opl", "<cmd>Octo pr list<cr>", desc = "List PRs (Octo)" },
    { "<leader>opc", "<cmd>Octo pr create<cr>", desc = "Create PR (Octo)" },
    { "<leader>opv", "<cmd>Octo pr checkout<cr>", desc = "Checkout PR (Octo)" },
    { "<leader>opr", "<cmd>Octo review start<cr>", desc = "Start PR Review (Octo)" },
    { "<leader>oil", "<cmd>Octo issue list<cr>", desc = "List Issues (Octo)" },
    { "<leader>oic", "<cmd>Octo issue create<cr>", desc = "Create Issue (Octo)" },
    { "<leader>ogl", "<cmd>Octo gist list<cr>", desc = "List Gists (Octo)" },
    { "<leader>ogc", "<cmd>Octo gist create<cr>", desc = "Create Gist (Octo)" },
    { "<leader>ors", "<cmd>Octo repo stats<cr>", desc = "Repo Stats (Octo)" },
    { "<leader>orv", "<cmd>Octo repo view<cr>", desc = "View Repo (Octo)" },
  },
}
