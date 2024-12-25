return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, options)
      vim.list_extend(
        options.ensure_installed,
        { "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes" }
      )
    end,
  },
}
