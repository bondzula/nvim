return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(options.ensure_installed, { "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes" })
    end
  },

  -- GitHub completion
  {
    "petertriho/cmp-git",
    ft = { "gitcommit", "octo", "NeogitCommitMessage" },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
    },
  },

  {
    "nvim-cmp",
    dependencies = {
      { "petertriho/cmp-git", opts = {} },
    },
    ---@module 'cmp'
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "git" })
    end,
  },
}
