require("luasnip.session.snippet_collection").clear_snippets "lua"

local ls = require "luasnip"
local s = ls.s
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local require = {
	s(
		"req",
		fmta(
			[[local <> = require("<>")]],
			{
				f(
					function(import_name)
						local parts = vim.split(import_name[1][1], ".", { plain = true })
						return parts[#parts] or ""
					end,
					{ 1 }
				),
				i(1),
			}
		)
	)
}

ls.add_snippets("lua", require)

local local_fn = {
	s(
		"lf",
		fmta([[
local function <>(<>)
	<>
end]],
			{i(1), i(2), i(0)}
		)
	)
}
ls.add_snippets("lua", local_fn)
