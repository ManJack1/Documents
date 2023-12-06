local wezterm = require("wezterm")
local selected_scheme = "Tokyo Night Storm"

local scheme = wezterm.get_builtin_color_schemes()[selected_scheme]
local C_ACTIVE_BG = scheme.selection_bg
local C_ACTIVE_FG = scheme.ansi[6]
local C_BG = scheme.background
local C_HL_1 = scheme.ansi[5]
local C_HL_2 = scheme.ansi[4]
local C_INACTIVE_FG
local bg = wezterm.color.parse(scheme.background)
local h, s, l, a = bg:hsla()
local act = wezterm.action
if l > 0.5 then
	C_INACTIVE_FG = bg:complement_ryb():darken(0.3)
else
	C_INACTIVE_FG = bg:complement_ryb():lighten(0.3)
end

scheme.tab_bar = {
	background = C_BG,
	new_tab = {
		bg_color = C_BG,
		fg_color = C_HL_2,
	},
	active_tab = {
		bg_color = C_ACTIVE_BG,
		fg_color = C_ACTIVE_FG,
	},
	inactive_tab = {
		bg_color = C_BG,
		fg_color = C_INACTIVE_FG,
	},
	inactive_tab_hover = {
		bg_color = C_BG,
		fg_color = C_INACTIVE_FG,
	},
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	if tab.is_active then
		return {
			{ Foreground = { Color = C_HL_1 } },
			{ Text = " " .. tab.tab_index + 1 },
			{ Foreground = { Color = C_HL_2 } },
			{ Text = ": " },
			{ Foreground = { Color = C_ACTIVE_FG } },
			{ Text = tab.active_pane.title .. " " },
			{ Background = { Color = C_BG } },
			{ Foreground = { Color = C_HL_1 } },
			{ Text = "|" },
		}
	end
	return {
		{ Foreground = { Color = C_HL_1 } },
		{ Text = " " .. tab.tab_index + 1 },
		{ Foreground = { Color = C_HL_2 } },
		{ Text = ": " },
		{ Foreground = { Color = C_INACTIVE_FG } },
		{ Text = tab.active_pane.title .. " " },
		{ Foreground = { Color = C_HL_1 } },
		{ Text = "|" },
	}
end)

return {
	color_schemes = {
		[selected_scheme] = scheme,
	},
	color_scheme = selected_scheme,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
	-- window_background_opacity = 0.8,
	font_size = 14.0,
	font = wezterm.font("JetBrains Mono", { weight = "Regular" }),
	font_rules = {
		{
			italic = true,
			font = wezterm.font("VictorMono Nerd Font", { italic = true, weight = "Bold" }),
		},
		{
			intensity = "Bold",
			font = wezterm.font("FiraCode Nerd Font", { weight = "Bold" }),
		},
	},
	---tmux term
	term = "tmux-256color",
	---keys mapping
	keys = {
		{ key = "w", mods = "ALT", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
		{ key = ",", mods = "ALT", action = act.ActivateTabRelative(-1) },
		{ key = ".", mods = "ALT", action = act.ActivateTabRelative(1) },
		{ key = "v", mods = "ALT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "c", mods = "ALT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		-- 设置快捷键以在窗格之间向左切换
		{ key = "LeftArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },

		-- 设置快捷键以在窗格之间向右切换
		{ key = "RightArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

		-- 设置快捷键以在窗格之间向上切换
		{ key = "UpArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },

		-- 设置快捷键以在窗格之间向下切换
		{ key = "DownArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		-- 设置快捷键以关闭当前分屏窗格
		{ key = "q", mods = "ALT", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		-- 调整分屏大小的快捷键
		-- 增加当前窗格的宽度
		{ key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },

		-- 减少当前窗格的宽度
		{ key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },

		-- 增加当前窗格的高度
		{ key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },

		-- 减少当前窗格的高度
		{ key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	},
}
