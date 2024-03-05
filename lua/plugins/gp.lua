return {
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup({
        openai_api_key = "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",
        model = "gpt-4-1106-preview",
        -- openai_api_key = "f37fc83c90b24ada95268717280e2420",
        -- openai_api_endpoint = "https://dztest.openai.azure.com/openai/deployments/gpt-4/chat/completions?api-version=2023-12-01-preview",
        hooks = {
          BufferChatNew = function(gp, _)
            -- call GpChatNew command in range mode on whole buffer
            vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
          end,

          -- example of adding command which writes unit tests for the selected code
          UnitTests = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please respond by writing table driven unit tests for the code above."
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.enew, nil, agent.model, template, agent.system_prompt)
          end,

          -- example of adding command which explains the selected code
          Explain = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please respond by explaining the code above."
            local agent = gp.get_chat_agent()
            gp.Prompt(params, gp.Target.popup, nil, agent.model, template, agent.system_prompt)
          end,
        }
      })

      -- require which-key plugin, and if it loads, set the keymapings for gp.nvim
      local wc_loaded, wc = pcall(require, "which-key")

      if not wc_loaded then
        vim.notify("Missing which-key plugin")
        return
      end

      wc.register({
        a = {
          name = "+gp",
          g = { "<cmd>GpChatToggle popup<cr>", "Toggle Chat" },
          r = { "<cmd>GpChatRespond<cr>", "Respond" },
          n = { "<cmd>GpChatNew popup<cr>", "New Chat" },
        },
      }, { mode = "n", prefix = "<leader>" })

      wc.register({
        a = {
          name = "+gp",
          g = { ":<C-u>'<,'>GpChatToggle popup<cr>", "Toggle Chat" },
          i = { ":<C-u>'<,'>GpImplement<cr>", "Implement" },
          u = { ":<C-u>'<,'>GpUnitTests<cr>", "Write unit test" },
          e = { ":<C-u>'<,'>GpExplain<cr>", "Explain" },
        },
      }, { mode = "v", prefix = "<leader>" })
    end,
  },
}
