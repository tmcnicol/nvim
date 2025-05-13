-- Taken from here https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L554
require("mason").setup()

-- Setup neovim lua configuration
require("lazydev").setup()

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

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local nmap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
		end

		local jump = function(jumpOpts)
			local floatOpts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}

			return function()
				vim.diagnostic.jump(jumpOpts)
				vim.diagnostic.open_float(floatOpts)
			end
		end

		nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		nmap("]d", jump({ count = 1 }), "next [D]iagnostic")
		nmap("[d", jump({ count = -1 }), "prev [D]iagnostic")

		nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		-- See `:help K` for why this keymap
		nmap("K", vim.lsp.buf.hover, "Hover Documentation")
		nmap("L", vim.lsp.buf.signature_help, "Signature Documentation")
		nmap("C", vim.lsp.buf.code_action, "Code Actions")

		local builtin = require("telescope.builtin")
		nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
		nmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
		nmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
		-- nmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
		-- nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		-- Create a command `:Format` local to the LSP buffer
		vim.api.nvim_buf_create_user_command(event.buf, "Format", function(_)
			vim.lsp.buf.format()
		end, { desc = "Format current buffer with LSP" })

		vim.diagnostic.config {
			severity_sort = true,
			float = { border = 'rounded', source = 'if_many' },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = '󰅚 ',
					[vim.diagnostic.severity.WARN] = '󰀪 ',
					[vim.diagnostic.severity.INFO] = '󰋽 ',
					[vim.diagnostic.severity.HINT] = '󰌶 ',
				},
			} or {},
			virtual_text = {
				source = 'if_many',
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		}
	end
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	'stylua', -- Used to format Lua code
})
require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
require('mason-lspconfig').setup({
	ensure_installed = {}, -- explicitly set to an empty table installs via mason-tool-installer
	automatic_enable = true,
	automatic_installation = false,
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- This handles overriding only values explicitly passed
			-- by the server configuration above. Useful when disabling
			-- certain features of an LSP (for example, turning off formatting for ts_ls)
			server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			require('lspconfig')[server_name].setup(server)
		end,
	},
})
--
-- -- 	ensure_installed = {},
-- -- 	-- automatic_installation = false,

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


cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	},
})
