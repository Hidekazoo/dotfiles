local wezterm = require("wezterm")
local M = {}

function M.apply(config)
	config.color_scheme = "nightfox"
	config.font_size = 14
	config.use_ime = true
	config.font = wezterm.font("UDEV Gothic 35NF")
	config.hyperlink_rules = wezterm.default_hyperlink_rules()

	wezterm.on("update-right-status", function(window, pane)
		window:set_right_status(wezterm.format({
			{ Text = " " .. window:active_workspace() .. " " },
		}))
	end)
end

return M
