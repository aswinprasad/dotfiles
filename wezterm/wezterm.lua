-- -- Initialize Configuration
local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- local opacity = 0.75
-- local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"
--
-- -- Font
-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "JetBrainsMono Nerd Font",
-- 		weight = "Regular",
-- 	},
-- 	"Segoe UI Emoji",
-- })
-- config.font_size = 10
--
-- -- Window
-- config.initial_rows = 45
-- config.initial_cols = 180
-- config.window_decorations = "RESIZE"
-- config.window_background_opacity = opacity
-- config.window_close_confirmation = "NeverPrompt"
-- config.win32_system_backdrop = "Acrylic"
-- config.max_fps = 60
-- config.animation_fps = 60
-- config.enable_scroll_bar = false
-- config.prefer_egl = true
-- -- config.front_end = "OpenGL"
--
-- -- Colors
-- config.colors = require("cyberdream")
-- config.force_reverse_video_cursor = true
--
-- -- Shell
-- config.default_prog = { "pwsh", "-NoLogo" }
--
-- -- Tabs
-- config.enable_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = true
-- config.show_tab_index_in_tab_bar = false
-- config.use_fancy_tab_bar = false
-- config.colors.tab_bar = {
-- 	background = transparent_bg,
-- 	new_tab = { fg_color = config.colors.background, bg_color = config.colors.brights[6] },
-- 	new_tab_hover = { fg_color = config.colors.background, bg_color = config.colors.foreground },
-- }
--
-- wezterm.on("format-tab-title", function(tab, _, _, _, hover)
-- 	local background = config.colors.brights[1]
-- 	local foreground = config.colors.foreground
--
-- 	if tab.is_active then
-- 		background = config.colors.brights[7]
-- 		foreground = config.colors.background
-- 	elseif hover then
-- 		background = config.colors.brights[8]
-- 		foreground = config.colors.background
-- 	end
--
-- 	local title = tostring(tab.tab_index + 1)
-- 	return {
-- 		{ Foreground = { Color = background } },
-- 		{ Text = "█" },
-- 		{ Background = { Color = background } },
-- 		{ Foreground = { Color = foreground } },
-- 		{ Text = title },
-- 		{ Foreground = { Color = background } },
-- 		{ Text = "█" },
-- 	}
-- end)
--
-- -- Keybindings
-- config.keys = {
-- 	-- Remap paste for clipboard history compatibility
-- 	{ key = "v", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
-- }
--
return config
