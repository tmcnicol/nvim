require("luasnip.session.snippet_collection").clear_snippets "go"

local ls = require "luasnip"

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta

-- Table driven tests as per https://dave.cheney.net/2019/05/07/prefer-table-driven-tests
-- Example function test should be like
-- func TestSplit(t *testing.T) {
--     tests := map[string]struct {
--         input string
--     }{
--         "simple":       {input: "foo bar",},
--     }
--
--     for name, tc := range tests {
--         t.Run(name, func(t *testing.T) {
--             got := Split(tc.input, tc.sep)
--             diff := cmp.Diff(tc.want, got)
--             if diff != "" {
--                 t.Fatalf(diff)
--             }
--         })
--     }
-- }
local table_test = {
	s(
		"tabletest",
		fmta([[
func Test<>(t *testing.T) {
	cases := map[string]struct{
		<>
	} {
		<> : {
			<>
		},
	}

	for name, tc := range(cases) {
		t.Run(name, func(t *testing.T) {
			<>
		})
	}
}
]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
				i(5),
			}
		)
	),
}
ls.add_snippets("go", table_test)
