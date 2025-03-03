local ls = require("luasnip")

-- Use file name for future / past daily notes
local function get_date_from_filename()
  local filename = vim.fn.expand("%:t")
  local date = filename:match("(%d%d%d%d%-%d%d%-%d%d)") -- matches YYYY-MM-DD pattern
  return date or os.date("%Y-%m-%d") -- fallback to today if no match
end

ls.add_snippets("markdown", {
  ls.s("daily", {
    ls.t({ "---", "cssclasses:", "  - daily", "  - " }),
    ls.f(function()
      return os.date("%A"):lower()
    end),
    ls.t({ "", "sleepScore: " }),
    ls.i(1),
    ls.t({ "", "weight: " }),
    ls.i(2),
    ls.t({ "", "journal: journal" }),
    ls.t({ "", "journal-start-date: " }),
    ls.f(get_date_from_filename),
    ls.t({ "", "journal-end-date: " }),
    ls.f(get_date_from_filename),
    ls.t({ "", "journal-section: day" }),
    ls.t({ "", "---", "", "# DAILY NOTE", "", "---", "", "### Plans for Today", "", "#### Meals" }),
    ls.t({ "", "", "- Breakfast: " }),
    ls.i(3),
    ls.t({ "", "- Lunch: " }),
    ls.i(4),
    ls.t({ "", "- Dinner: " }),
    ls.i(5),
    ls.t({ "", "- Snacks: " }),
    ls.i(6),
    ls.t({ "", "", "#### Exercise", "", "" }),
    ls.i(7),
    ls.t({ "", "", "#### Goals", "", "" }),
    ls.i(8),
    ls.t({ "", "", "---", "", "### Log", "", "" }),
    ls.i(9),
    ls.t({ "", "", "---", "", "### Journal", "", "" }),
    ls.i(10),
  }),
}, { key = "markdown_daily" })

ls.add_snippets("markdown", {
  ls.s("ts", {
    ls.t({ "- **" }),
    ls.f(function()
      return os.date("%H:%M")
    end),
    ls.t({ "**: " }),
    ls.i(1),
  }),
}, { key = "markdown_timestamp" })

-- Project note snippet
ls.add_snippets("markdown", {
  ls.s("project", {
    ls.t({ "---" }),
    ls.t({ "", "date: " }),
    ls.f(function()
      return '"[[' .. os.date("%Y-%m-%d") .. ']]"'
    end),
    ls.t({ "", "time: " }),
    ls.f(function()
      return os.date("%H:%M")
    end),
    ls.t({ "", "tags:", "  - project" }),
    ls.i(1),
    ls.t({ "", "area: " }),
    ls.i(2), -- parent area if applicable
    ls.t({ "", "deadline: " }),
    ls.i(3),
    ls.t({ "", "other_links: " }),
    ls.i(4),
    ls.t({ "", "---", "", "# " }),
    ls.i(5),
    ls.t({ "", "", "## Overview", "" }),
    ls.i(6),
    ls.t({ "", "", "## Goals", "" }),
    ls.i(0),
  }),
}, { key = "markdown_project" })

-- Area note snippet
ls.add_snippets("markdown", {
  ls.s("area", {
    ls.t({ "---" }),
    ls.t({ "", "date: " }),
    ls.f(function()
      return '"[[' .. os.date("%Y-%m-%d") .. ']]"'
    end),
    ls.t({ "", "time: " }),
    ls.f(function()
      return os.date("%H:%M")
    end),
    ls.t({ "", "tags:", "  - area" }),
    ls.i(1),
    ls.t({ "", "---", "", "# " }),
    ls.i(2),
    ls.t({ "", "", "## Description", "" }),
    ls.i(0),
  }),
}, { key = "markdown_area" })

-- Resource note snippet
ls.add_snippets("markdown", {
  ls.s("resource", {
    ls.t({ "---" }),
    ls.t({ "", "date: " }),
    ls.f(function()
      return '"[[' .. os.date("%Y-%m-%d") .. ']]"'
    end),
    ls.t({ "", "time: " }),
    ls.f(function()
      return os.date("%H:%M")
    end),
    ls.t({ "", "tags:", "  - resource" }),
    ls.i(1),
    ls.t({ "", "aliases: " }),
    ls.i(2),
    ls.t({ "", "project: " }),
    ls.i(3),
    ls.t({ "", "area: " }),
    ls.i(4),
    ls.t({ "", "other_links: " }),
    ls.i(5),
    ls.t({ "", "---", "", "# " }),
    ls.i(6),
    ls.t({ "", "", "" }),
    ls.i(0),
  }),
}, { key = "markdown_resource" })

-- Fleeting note snippet
ls.add_snippets("markdown", {
  ls.s("fleeting", {
    ls.t({ "---" }),
    ls.t({ "", "date: " }),
    ls.f(function()
      return '"[[' .. os.date("%Y-%m-%d") .. ']]"'
    end),
    ls.t({ "", "time: " }),
    ls.f(function()
      return os.date("%H:%M")
    end),
    ls.t({ "", "tags:" }),
    ls.i(1),
    ls.t({ "", "aliases: " }),
    ls.i(2),
    ls.t({ "", "project: " }),
    ls.i(3),
    ls.t({ "", "area: " }),
    ls.i(4),
    ls.t({ "", "other_links: " }),
    ls.i(5),
    ls.t({ "", "---", "", "# " }),
    ls.i(6),
    ls.t({ "", "", "" }),
    ls.i(0),
  }),
}, { key = "markdown_feeting" })

-- Person note snippet
ls.add_snippets("markdown", {
  ls.s("person", {
    ls.t({ "---" }),
    ls.t({ "", "date: " }),
    ls.f(function()
      return "[[" .. os.date("%Y-%m-%d") .. "]]"
    end),
    ls.t({ "", "tags: person" }),
    ls.i(1),
    ls.t({ "", "role: " }),
    ls.i(2),
    ls.t({ "", "email: " }),
    ls.i(3),
    ls.t({ "", "phone: " }),
    ls.i(4),
    ls.t({ "", "aliases: " }),
    ls.i(5),
    ls.t({ "", "---", "", "# " }),
    ls.i(6),
    ls.t({ "", "", "## Key Information", "", "- Interests:", "- Important dates:", "- Preferences:", "" }),
    ls.i(7),
    ls.t({ "", "", "## Follow-ups", "" }),
    ls.i(8),
    ls.t({ "", "", "## Notes", "" }),
    ls.i(0),
  }),
}, { key = "markdown_person" })

-- Meeting note snippet
ls.add_snippets("markdown", {
  ls.s("meeting", {
    ls.t({ "---" }),
    ls.t({ "", "date: " }),
    ls.f(function()
      return "[[" .. os.date("%Y-%m-%d") .. "]]"
    end),
    ls.t({ "", "time: " }),
    ls.f(function()
      return os.date("%H:%M")
    end),
    ls.t({ "", "project: " }),
    ls.i(1),
    ls.t({ "", "attendees: " }),
    ls.i(2),
    ls.t({ "", "tags: meeting" }),
    ls.i(3),
    ls.t({ "", "---", "", "# " }),
    ls.i(4),
    ls.t({ "", "", "## Agenda", "" }),
    ls.i(5),
    ls.t({ "", "", "## Decision", "" }),
    ls.i(6),
    ls.t({ "", "", "## Action Items", "", "- [ ] " }),
    ls.i(7),
    ls.t({ "", "", "## Follow-ups", "" }),
    ls.i(0),
  }),
}, { key = "markdown_meeting" })
