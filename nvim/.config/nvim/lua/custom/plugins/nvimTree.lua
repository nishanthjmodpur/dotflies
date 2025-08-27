return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			-- Customize options if you need
			auto_reload_on_write = true,
			hijack_netrw = true,
			update_cwd = true,
			view = {
				width = 30,
				side = "left",
				auto_resize = true,
			},
		},
		config = function()
			require("nvim-tree").setup()
			-- Keymaps and setup for nvim-tree
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
		end,
	},
}
