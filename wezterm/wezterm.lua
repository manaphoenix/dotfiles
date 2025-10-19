-- ~/.config/wezterm/wezterm.lua
local wezterm = require("wezterm")

-- Load Cyberdream theme
local cyberdream = require("cyberdream")

-- ─────────────────────────────────────────────────────────────
--  GUI Startup — Center Window and Set Size
-- ─────────────────────────────────────────────────────────────
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	local guiwin = window:gui_window()
	local screen = wezterm.gui.screens().main

	local window_width = math.floor(screen.width * 0.75)
	local window_height = math.floor(screen.height * 0.75)

	local x = math.floor((screen.width - window_width) / 2)
	local y = math.floor((screen.height - window_height) / 2)

	guiwin:set_position(x, y)
	guiwin:set_inner_size(window_width, window_height)
end)

-- ─────────────────────────────────────────────────────────────
--  Main Configuration
-- ─────────────────────────────────────────────────────────────
return {
	-- Appearance ------------------------------------------------
	color_scheme = "Cyberdream (custom)",
	colors = cyberdream,
	window_decorations = "RESIZE", -- cleaner title bar
	enable_tab_bar = false,
	force_reverse_video_cursor = true,
	window_background_opacity = 0.88,
	macos_window_background_blur = 15, -- harmless on Windows, nice if ported later

	window_padding = {
		left = 8,
		right = 8,
		top = 6,
		bottom = 6,
	},

	window_frame = {
		font_size = 10.5,
		active_titlebar_bg = "#16181a",
		inactive_titlebar_bg = "#16181a",
	},

	-- Font ------------------------------------------------------
	font = wezterm.font_with_fallback({
		"FiraCode Nerd Font",
		"JetBrainsMono Nerd Font",
		"Symbols Nerd Font",
	}),
	font_size = 12.5,
	line_height = 1.1,
	freetype_load_target = "Light", -- smoother rendering
	freetype_load_flags = "NO_HINTING",

	-- Shell / Behavior -----------------------------------------
	default_prog = { "pwsh.exe", "-NoLogo" },
	scrollback_lines = 8000,
	term = "wezterm",
	use_ime = true,
	native_macos_fullscreen_mode = false,

	-- Key Bindings ---------------------------------------------
	keys = {
		{ key = "Enter", mods = "CTRL|SHIFT", action = wezterm.action.ToggleFullScreen },
		{ key = "f", mods = "CTRL|SHIFT", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
		{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain") },
		{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	},

	-- Performance ----------------------------------------------
	max_fps = 165,
	animation_fps = 120,
	cursor_blink_ease_in = "EaseInOut",
	cursor_blink_ease_out = "EaseInOut",
	cursor_blink_rate = 800,

	-- Initial Window Size --------------------------------------
	initial_cols = 180,
	initial_rows = 50,
}
