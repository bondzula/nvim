vim.g.telescope_finder_command = { "rg", "--files", "--hidden", "--ignore" }

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    version = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "ThePrimeagen/git-worktree.nvim" },
    },
    keys = {
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Diagnostics" },
      { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      -- search
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      -- LSP
      { "<leader>cr", "<cmd>Telescope lsp_references<cr>", desc = "Lsp References" },
      { "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Lsp Document Symbols" },
      { "<leader>cs", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Lsp Workspace Symbols" },

      {
        "<leader>gw",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
        desc = "Switch git worktree",
      },
      {
        "<leader>gW",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "Create git worktree",
      },
    },
    opts = function()
      local actions = require("telescope.actions")
      local finders = require("telescope.finders")
      local make_entry = require("telescope.make_entry")
      local action_state = require("telescope.actions.state")
      local action_layout = require("telescope.actions.layout")

      vim.g.telescope_finder_command = { "rg", "--files", "--hidden", "--ignore" }

      local function toggle_flag(prompt_bufnr, flag, no_flag)
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local cmd = vim.g.telescope_finder_command

        if cmd == nil then
          return
        end

        local opts = current_picker.finder.opts or {}
        opts.entry_maker = make_entry.gen_from_file(opts)

        local flag_found = false
        for i, option in ipairs(cmd) do
          if option == flag then
            cmd[i] = no_flag
            flag_found = true
          elseif option == no_flag then
            cmd[i] = flag
            flag_found = true
          end
        end

        -- If neither flag nor no_flag was found, add the flag
        if not flag_found then
          table.insert(cmd, flag)
        end

        vim.g.telescope_finder_command = cmd
        current_picker:refresh(finders.new_oneshot_job(cmd, opts), {})
      end

      local function toggle_hidden(prompt_bufnr)
        toggle_flag(prompt_bufnr, "--hidden", "--no-hidden")
      end

      local function toggle_ignore(prompt_bufnr)
        toggle_flag(prompt_bufnr, "--ignore", "--no-ignore")
      end

      local open_with_trouble = function(...)
        return require("trouble.sources.telescope").open(...)
      end

      return {
        defaults = {
          preview = {
            filesize_limit = 0.1, -- MB
          },
          path_display = {
            "filename_first",
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim", -- Don't show weird indented lines
          },
          layout_config = {
            -- preview_width = 0.6,
            prompt_position = "bottom",
          },
          prompt_position = "bottom",
          prompt_prefix = " ",
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ["<esc>"] = actions.close, -- Trying this out
              ["<c-t>"] = open_with_trouble,
              ["<M-t>"] = open_with_trouble,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
              ["<M-p>"] = action_layout.toggle_preview,
              ["<M-h>"] = toggle_hidden,
              ["<M-i>"] = toggle_ignore,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
              },
            },
          },
          commands = {
            prompt_prefix = " ",
          },
          git_files = {
            prompt_prefix = " ",
            show_untracked = true,
          },
          -- find_files = {
          --   find_command = vim.g.telescope_finder_command,
          -- },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("git_worktree")

      local no_preview = function()
        return require("telescope.themes").get_dropdown({
          find_command = vim.g.telescope_finder_command,
          borderchars = {
            { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          },
          width = 0.6,
          previewer = false,
          layout_config = {
            prompt_position = "top",
          },
        })
      end

      vim.keymap.set("n", "<leader><leader>", function()
        require("telescope.builtin").find_files(no_preview())
      end, {})

      vim.keymap.set("n", "<C-p>", function()
        require("telescope.builtin").find_files(no_preview())
      end, {})

      vim.keymap.set("n", "<leader>,", function()
        require("telescope.builtin").buffers(no_preview())
      end, {})
    end,
  },
}
