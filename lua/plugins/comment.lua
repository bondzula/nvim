-- Commenting plugin
return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      -- Not sure why this is not working, as per documentation
      -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    },
  },
}
