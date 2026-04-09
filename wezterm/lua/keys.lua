local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.apply(config)
	config.leader = { key = "g", mods = "CTRL", timeout_milliseconds = 1000 }
	config.keys = {
		{ key = "x", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "s", mods = "LEADER", action = act.QuickSelect },
		{
			key = "d",
			mods = "CMD",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "d",
			mods = "CMD|SHIFT",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "c",
			mods = "CMD",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "w",
			mods = "CMD",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
		{
			key = "v",
			mods = "CTRL|ALT",
			action = wezterm.action_callback(function(window, pane)
				local success, stdout, stderr = wezterm.run_child_process({
					"osascript",
					"-e",
					[[
            set theFile to (POSIX path of (path to temporary items)) & "clip_" & (do shell script "date +%s") & ".png"
            try
              set pngData to the clipboard as «class PNGf»
              set fileRef to open for access theFile with write permission
              write pngData to fileRef
              close access fileRef
              return theFile
            on error
              return ""
            end try
          ]],
				})
				if success and stdout ~= "" then
					local path = stdout:gsub("%s+$", "")
					pane:send_text(path)
				end
			end),
		},
		{ key = "w", mods = "CMD|SHIFT", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
		{
			key = "n",
			mods = "CMD|SHIFT",
			action = act.PromptInputLine({
				description = "Enter workspace name",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
					end
				end),
			}),
		},
		{ key = "[", mods = "ALT", action = act.SwitchWorkspaceRelative(-1) },
		{ key = "]", mods = "ALT", action = act.SwitchWorkspaceRelative(1) },
	}
end

return M
