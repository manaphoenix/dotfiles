-- cyberdream theme for WezTerm
return {
	-- Core colors
	foreground = "#ffffff",
	background = "#16181a",

	-- Cursor
	cursor_bg = "#ffffff",
	cursor_fg = "#16181a",
	cursor_border = "#ffffff",

	-- Selection
	selection_fg = "#ffffff",
	selection_bg = "#3c4048",

	-- UI elements
	scrollbar_thumb = "#16181a",
	split = "#16181a",

	-- ANSI colors
	ansi = {
		"#16181a", -- black
		"#ff6e5e", -- red
		"#5eff6c", -- green
		"#f1ff5e", -- yellow
		"#5ea1ff", -- blue
		"#bd5eff", -- magenta
		"#5ef1ff", -- cyan
		"#ffffff", -- white
	},

	-- Bright variants
	brights = {
		"#3c4048", -- bright black
		"#ff6e5e", -- bright red
		"#5eff6c", -- bright green
		"#f1ff5e", -- bright yellow
		"#5ea1ff", -- bright blue
		"#bd5eff", -- bright magenta
		"#5ef1ff", -- bright cyan
		"#ffffff", -- bright white
	},

	-- Indexed colors
	indexed = {
		[16] = "#ffbd5e",
		[17] = "#ff6e5e",
	},
}
