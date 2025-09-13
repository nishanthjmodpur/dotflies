return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*", -- Consider pinning to a specific version if issues persist
	opts = {
		keymap = {
			preset = "none",
			-- Main completion keymaps
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Up>"] = { "snippet_backward", "fallback" },
			["<Down>"] = { "snippet_forward", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		},
		-- Configure command-line completion (if needed)
		cmdline = {
			keymap = {
				preset = "none",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-space>"] = { "show", "fallback" },
				["<C-y>"] = { "select_and_accept" },
				["<C-e>"] = { "cancel" },
			},
			completion = { menu = { auto_show = true } },
		},
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
