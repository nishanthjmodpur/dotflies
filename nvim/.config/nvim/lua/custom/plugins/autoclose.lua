-- auto pairs & closes brackets
return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup({
			-- Example configuration options
			disable_filetype = { "TelescopePrompt", "neo-tree" }, -- Disable in certain filetypes
			check_ts = true, -- Use Treesitter for additional features
		})
	end,
	event = "InsertEnter",
}
