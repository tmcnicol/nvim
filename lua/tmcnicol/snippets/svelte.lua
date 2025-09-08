require("luasnip.session.snippet_collection").clear_snippets "svelte"

local ls = require "luasnip"

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta

local hero_icon = {
	s(
		"icon",
		fmta([[
<<Icon src={<>} class="<>" <>/>>
]],
			{
				i(1),
				i(2),
				c(2, {
					t("solid"),
					t(""),
				}),
			}
		)
	),
}

-- This doesn't work?
local eslint_no_unused_vars = {
	s(
		"nounused", t("// eslint-disable-line no-unused-vars")
	),
}

ls.add_snippets("svelte", hero_icon, eslint_no_unused_vars)
