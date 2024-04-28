local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local func = ls.function_node

local date = function() return { os.date "%Y-%m-%d" } end

ls.add_snippets(
	"vimwiki",
	{
		s("--",
			{ t({ "---", "" }),
				t("date_created: "), func(date),
				t({ '', 'vimwiki_tags: ":' }), i(1), t(':"'),
				t({ "", "tags: [" }), i(2), t("]"),
				t({ "", "---", "" }),
				i(9)
			}
		)
	})
