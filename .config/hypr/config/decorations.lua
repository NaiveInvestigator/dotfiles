-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Decorations Configuration                ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require("config.colors")

-- https://wiki.hyprland.org/0.45.0/Configuring/Variables/#decoration
hl.config({
    decoration = {
        active_opacity = 1,
        rounding       = 4,

        -- https://wiki.hyprland.org/0.45.0/Configuring/Variables/#blur
        blur = {
            size    = 5,
            passes  = 3, -- more passes = more resource intensive.
            xray    = true,
        },

        -- https://wiki.hyprland.org/0.45.0/Configuring/Variables/#shadow
        shadow = {
            enabled = false,
        },
    },
})
