-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Keybinds                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require("config.defaults")

-- https://wiki.hyprland.org/Configuring/Binds/

-- ======= General =======
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal),                                                            { description = "Opens your preferred terminal emulator" })
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(filemanager),                                                         { description = "Opens your preferred filemanager" })
hl.bind(mainMod .. " + W",      hl.dsp.exec_cmd(wallpaper),                                                           { description = "Choose Your Wallpaper" })
hl.bind(mainMod .. " + A",      hl.dsp.exec_cmd(capturing),                                                           { description = "Screen capture selection" })
hl.bind(mainMod .. " + Q",      hl.dsp.window.close(),                                                                { description = "Closes (not kill) current window" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd('loginctl terminate-user ""'),                                     { description = "Exits Hyprland by terminating the user session" })
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }),                                           { description = "Switches current window between floating and tiling mode" })
hl.bind(mainMod .. " + SPACE",  hl.dsp.exec_cmd(applauncher),                                                         { description = "Runs your application launcher" })
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen(),                                                           { description = "Toggles current window fullscreen mode" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 1 }),                                            { description = "Toggles workspace fullscreen" })
hl.bind(mainMod .. " + Y",      hl.dsp.window.pin(),                                                                  { description = "Pin current window (shows on all workspaces)" })
hl.bind(mainMod .. " + J",      hl.dsp.layout("togglesplit"),                                                         { description = "Toggles current window split mode" }) -- dwindle
hl.bind("CTRL + SPACE",         hl.dsp.exec_cmd(applauncher),                                                         { description = "Toggles applauncher" })

-- ======= Screenshots =======
hl.bind("PRINT",                hl.dsp.exec_cmd('grimblast copy output && notify-send "Screenshot copied to clipboard"'))
-- hl.bind("PRINT",             hl.dsp.exec_cmd('grimblast save screen "$HOME/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png" && notify-send "Screenshot saved to Screenshot Folder"'))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grimblast --freeze copy area"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("grimblast --freeze save area - | tesseract stdin stdout | wl-copy"))

-- ======= Window Cycling =======
-- fix this
-- hl.bind("ALT + TAB",            hl.dsp.focus({ cyclenext = true }))
-- hl.bind("ALT + SHIFT + TAB",   hl.dsp.focus({ cyclenext = true, prev = true }))

-- ======= Grouping Windows =======
-- fix this
-- hl.bind(mainMod .. " + K",      hl.dsp.window.togglegroup(),                                                          { description = "Toggles current window group mode (ungroup all related)" })
-- hl.bind(mainMod .. " + Tab",    hl.dsp.window.changegroupactive({ direction = "f" }),                                  { description = "Switches to the next window in the group" })

-- ======= Toggle Gaps =======
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"'), { description = "Set CachyOS default gaps" })
hl.bind(mainMod .. " + G",      hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"'),    { description = "Remove gaps between windows" })

-- ======= Volume Control =======
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{if($1>100) system(\"pactl set-sink-volume @DEFAULT_SINK@ 100%\")}'"), { locked = true, repeating = true }) -- Raise Volume
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),                          { locked = true, repeating = true }) -- Lower Volume
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("amixer sset Master toggle | sed -En '/\\[on\\]/ s/.*\\[([0-9]+)%\\].*/\\1/ p; /\\[off\\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"), { locked = true, repeating = true }) -- Mutes player audio

-- ======= Playback Control =======
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggles play/pause" })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),        { description = "Next track" })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),    { description = "Previous track" })

-- ======= Screen Brightness =======
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true }) -- Increases brightness 5%
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true }) -- Decreases brightness 5%

-- ======= Misc =======
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("gnome-calculator"),                                               { description = "Runs the calculator application" })
-- hl.bind(mainMod .. " + L",    hl.dsp.exec_cmd("swaylock-fancy -e -K -p 10 -f Hack-Regular"),                       { description = "Lock the screen" })
-- hl.bind(mainMod .. " + L",    hl.dsp.exec_cmd("hyprlock"),                                                         { description = "Lock the screen" })
hl.bind(mainMod .. " + L",       hl.dsp.exec_cmd("qs -c noctalia-shell ipc call lockScreen lock"))
hl.bind(mainMod .. " + O",       hl.dsp.exec_cmd("killall -SIGUSR2 waybar"),                                          { description = "Reload/restarts Waybar" })

-- ======= Window Actions =======

-- Move window with mainMod + LMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Move the window towards a direction" })

-- Move window towards a direction
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }), { description = "Move active window to the left" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }), { description = "Move active window to the right" })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }), { description = "Move active window upwards" })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }), { description = "Move active window downwards" })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }),  { description = "Move focus to the left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus to the right" })
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }),    { description = "Move focus upwards" })
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }),  { description = "Move focus downwards" })

-- Resize windows — submap
-- https://wiki.hyprland.org/Configuring/Binds/#submaps
-- hl.bind(mainMod .. " + R", hl.dsp.submap("resize"), { description = "Activates window resizing mode" })
-- hl.submap("resize", function()
--     hl.bind("right",  hl.dsp.window.resizeactive({  15,   0 }), { description = "Resize to the right (resizing mode)" })
--     hl.bind("left",   hl.dsp.window.resizeactive({ -15,   0 }), { description = "Resize to the left (resizing mode)" })
--     hl.bind("up",     hl.dsp.window.resizeactive({   0, -15 }), { description = "Resize upwards (resizing mode)" })
--     hl.bind("down",   hl.dsp.window.resizeactive({   0,  15 }), { description = "Resize downwards (resizing mode)" })
--     hl.bind("l",      hl.dsp.window.resizeactive({  15,   0 }), { description = "Resize to the right (resizing mode)" })
--     hl.bind("h",      hl.dsp.window.resizeactive({ -15,   0 }), { description = "Resize to the left (resizing mode)" })
--     hl.bind("k",      hl.dsp.window.resizeactive({   0, -15 }), { description = "Resize upwards (resizing mode)" })
--     hl.bind("j",      hl.dsp.window.resizeactive({   0,  15 }), { description = "Resize downwards (resizing mode)" })
--     hl.bind("escape", hl.dsp.submap("reset"),                   { description = "Ends window resizing mode" })
-- end)
--
-- Quick resize with keyboard
-- !!! added mainMod here because CTRL + SHIFT is used for word selection in various text editors
-- fix this
-- hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.resizeactive({  15,   0 }), { description = "Resize to the right" })
-- hl.bind(mainMod .. " + CTRL + SHIFT + left",  hl.dsp.window.resizeactive({ -15,   0 }), { description = "Resize to the left" })
-- hl.bind(mainMod .. " + CTRL + SHIFT + up",    hl.dsp.window.resizeactive({   0, -15 }), { description = "Resize upwards" })
-- hl.bind(mainMod .. " + CTRL + SHIFT + down",  hl.dsp.window.resizeactive({   0,  15 }), { description = "Resize downwards" })
-- hl.bind(mainMod .. " + CTRL + SHIFT + l",     hl.dsp.window.resizeactive({  15,   0 }), { description = "Resize to the right" })
-- hl.bind(mainMod .. " + CTRL + SHIFT + h",     hl.dsp.window.resizeactive({ -15,   0 }), { description = "Resize to the left" })
-- hl.bind(mainMod .. " + CTRL + SHIFT + k",     hl.dsp.window.resizeactive({   0, -15 }), { description = "Resize upwards" })
-- hl.bind(mainMod .. " + CTRL + SHIFT + j",     hl.dsp.window.resizeactive({   0,  15 }), { description = "Resize downwards" })

-- Resize/move window with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Resize the window
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- Drag window

-- Move active window to a workspace with mainMod + CTRL + [0-9] (and switch to it)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + CTRL + " .. key,       hl.dsp.window.move({ workspace = i }),                  { description = "Move window and switch to workspace " .. i })
end
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ workspace = "-1" }), { description = "Move window and switch to the next workspace" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ workspace = "+1" }), { description = "Move window and switch to the previous workspace" })

-- Move active window silently to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }), { description = "Move window silently to workspace " .. i })
end

-- ======= Workspace Actions =======

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to workspace " .. i })
end

-- Scroll through workspaces
hl.bind(mainMod .. " + PERIOD",     hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll through workspaces incrementally" })
hl.bind(mainMod .. " + COMMA",      hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll through workspaces decrementally" })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll through workspaces incrementally" })
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll through workspaces decrementally" })
hl.bind(mainMod .. " + slash",      hl.dsp.focus({ workspace = "previous" }), { description = "Switch to the previous workspace" })

-- Special workspaces (scratchpads)
hl.bind(mainMod .. " + minus",              hl.dsp.window.move({ workspace = "special" }),                            { description = "Move active window to Special workspace" })
hl.bind(mainMod .. " + equal",              hl.dsp.workspace.toggle_special("special"),                               { description = "Toggles the Special workspace" })
hl.bind(mainMod .. " + F1",                 hl.dsp.workspace.toggle_special("scratchpad"),                            { description = "Call special workspace scratchpad" })
hl.bind(mainMod .. " + ALT + SHIFT + F1",   hl.dsp.window.move({ workspace = "special:scratchpad", silent = true }), { description = "Move active window to special workspace scratchpad" })

-- ======= Additional Settings =======

-- https://wiki.hyprland.org/Configuring/Binds
hl.config({
    binds = {
        allow_workspace_cycles          = true,
        workspace_back_and_forth        = true,
        workspace_center_on             = 1,
        movefocus_cycles_fullscreen     = true,
        window_direction_monitor_fallback = true,
    },
})
