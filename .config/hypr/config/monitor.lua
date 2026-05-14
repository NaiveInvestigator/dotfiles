-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Monitor Configuration                   ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
-- Monitor wiki https://wiki.hyprland.org/0.45.0/Configuring/Monitors/

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

-- If you need to scale things like steam etc, please uncomment these lines.
-- Adjust GDK_SCALE accordingly to your liking.
hl.config({
    xwayland = {
        enabled = true,
        -- force_zero_scaling = true,  -- Unscale XWayland
    },
})

-- hl.env("GDK_SCALE", "1.25")  -- GDK Scaling Factor
