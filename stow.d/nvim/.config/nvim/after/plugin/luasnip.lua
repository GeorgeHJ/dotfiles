local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local func = ls.function_node

local date = function() return { os.date "%Y-%m-%d" } end

ls.add_snippets(
	"vimwiki",
	{
		s({
				trig = "--",
				name = "Yaml Front Matter",
				desc = "Add YAML front matter.",
				show_condition = function()
					local top_line = vim.fn.line(".") == 1
					return top_line
				end
			},
			{ t({ "---", "" }),
				t("date_created: "), func(date),
				t({ "", "tags: [" }), i(1), t("]"),
				t({ "", "---", "" }),
				i(9)
			}
		)
	})
