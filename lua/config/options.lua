-- This file is automatically loaded by plugins.config

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
-- TODO: Check markdown files for this
opt.conceallevel = 0 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.laststatus = 3 -- Global statusline
opt.mouse = "a" -- Enable mouse mode
opt.number = false -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.timeoutlen = 250
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 50 -- Save swap file and trigger CursorHold
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.cmdheight = 1 -- Height of the command bar

-- Disable swap, and backup files
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.splitkeep = "screen"
opt.shortmess:append({ C = true })

-- Avoid issues with new terraform files
vim.filetype.add({
  extension = {
    tf = "terraform",
  },
})
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
