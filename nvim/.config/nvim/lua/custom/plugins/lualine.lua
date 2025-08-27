return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" }, -- Required for icons
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true, -- Enable icons (useful if you have nerd fonts)
				theme = "codedark", -- You can change this to your preferred theme
				-- section_separators = { left = "", right = "" }, -- these create a stylish separator
				-- component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" }, -- these create a stylish separator
				component_separators = { left = "|", right = "|" },
				disabled_filetypes = { "NvimTree" }, -- Disable lualine in specific filetypes
			},
			sections = {
				-- Mode (INSERT, NORMAL, etc.)
				lualine_a = { { "mode" } },

				-- Git information (branch and diff)
				lualine_b = { "branch", "diff" },

				-- Filename and file information
				lualine_c = { "filename" },

				-- Encoding, fileformat, filetype
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_active_clients()
							if #clients > 0 then
								-- Show the name of the first active LSP client (e.g., clangd)
								return clients[1].name
							else
								return "No LSP"
							end
						end,
					},
					"encoding",
					"fileformat",
					"filetype",
				},

				-- Cursor progress
				lualine_y = { "progress" },

				-- Location: Line number and column
				lualine_z = { "location" },
			},
			extensions = { "fugitive" }, -- Enable fugitive for git status in the statusline
		})
	end,
}
