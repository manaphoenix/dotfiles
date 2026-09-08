return {
	"folke/noice.nvim",
	event = "VeryLazy",

	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},

		cmdline = {
			format = {
				cmdline = { lang = "" },
				search_down = { lang = "" },
				search_up = { lang = "" },
				filter = { lang = "" },
				lua = { lang = "" },
			},
		},

		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
	},

	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}