local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local func = ls.function_node

local date = function()
  return { os.date("%Y-%m-%d") }
end

ls.add_snippets("vimwiki", {
  s(
    {
      trig = "--",
      name = "Yaml Front Matter",
      desc = "Add YAML front matter.",
      show_condition = function()
        local top_line = vim.fn.line(".") == 1
        return top_line
      end,
    },
    {
      t({ "---", "" }),
      t("date_created: "),
      func(date),
      t({ "", "tags: [" }),
      i(1),
      t("]"),
      t({ "", "---", "" }),
      i(9),
    }
  ),
  s({ trig = "<!", name = "Vimwiki Tags", desc = "Add Vimwiki tags, wrapped in an html comment." }, {
    t({ "<!-- :" }),
    i(1),
    t({ ": -->" }),
    i(9),
  }),
  s({ trig = "```", name = "Code Block", desc = "Insert a code block with language specifier." }, {
    t("```"),
    i(1, "lang"),
    t({ "", "" }),
    i(2),
    t({ "", "```" }),
    t({ "", "" }),
    t({ "", "" }),
    i(3),
  }),
  s({ trig = "```", name = "Code Block (no lang)", desc = "Insert a code block without language specifier." }, {
    t("```"),
    t({ "", "" }),
    i(1),
    t({ "", "```" }),
    t({ "", "" }),
    t({ "", "" }),
    i(2),
  }),
})
