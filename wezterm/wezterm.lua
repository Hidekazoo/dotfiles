local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.automatically_reload_config = true

local keys = require("lua.keys")
local ui = require("lua.ui")

keys.apply(config)
ui.apply(config)

return config
