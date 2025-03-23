-- Taken from here https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L554
require("mason").setup()
require("mason-lspconfig").setup()

-- Setup neovim lua configuration
require("neodev").setup()

local servers = {
	gopls = {},
	tailwindcss = {},
	svelte = {},
	cmake = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = { 'hs' }
			},
		},
	},
}

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")


	-- These don't work as of vim 0.10
	-- nmap("<leader>vd", vim.diagnostic.goto_next(), "[V]iew [D]iagnostic")
	-- nmap("[d", vim.diagnostic.goto_next(), "next [D]iagnostic")
	-- nmap("[d", vim.diagnostic.goto_prev(), "prev [D]iagnostic")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("L", vim.lsp.buf.signature_help, "Signature Documentation")

	local builtin = require("telescope.builtin")
	nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
	nmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
	-- nmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
	-- nmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
	-- nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local lspconfig = require "mason-lspconfig"

lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

lspconfig.setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end,
}

local cmp = require("cmp")
local luasnip = require "luasnip"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = cmp.mapping.preset.insert {
		["<C-y>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Insert,
		}),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		["<C-Space>"] = cmp.mapping.complete(),
	},
	sources = {
		-- { name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = 'buffer' },
		{ name = "path" },
	},
})


cmp.setup.filetype( {"sql"}, {
	sources = {
		{ name = "vim-dadbod-completion"},
		{ name = "buffer"},
	},
})
