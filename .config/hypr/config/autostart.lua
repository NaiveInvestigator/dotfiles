-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Autostart Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require("config.defaults")

-- Autostart wiki https://wiki.hyprland.org/0.45.0/Configuring/Keywords/#executing

hl.on("hyprland.start", function()
    -- hl.exec_cmd("swaybg -o \\* -i /usr/share/wallpapers/cachyos-wallpapers/Skyscraper.png -m fill")
    -- hl.exec_cmd("swww-daemon")
    -- hl.exec_cmd("waybar &")
    -- hl.exec_cmd("hyprpanel &")
    hl.exec_cmd("kdeconnectd &")
    -- hl.exec_cmd("qs -c noctalia-shell &")
    hl.exec_cmd("noctalia &")
    -- hl.exec_cmd("qbittorrent &")
    hl.exec_cmd("fcitx5 -d &")
    -- hl.exec_cmd("mako &")
    -- hl.exec_cmd("nm-applet --indicator &")
    -- hl.exec_cmd("bash -c \"mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob -c ~/.config/hypr/wob.ini & disown\" &")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1 &")

    -- Slow app launch fix
    hl.exec_cmd("systemctl --user import-environment &")
    hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null &")
    hl.exec_cmd("dbus-update-activation-environment --systemd &")

    -- Idle configuration
    hl.exec_cmd(idlehandler)

    -- recorder
    hl.exec_cmd("tmux new -d -s 0 \"~/repos/StreaMonitor/run.sh\"")
end)
