-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                      General Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require("config.colors")

hl.config({
    general = {
        gaps_in         = 3,
        gaps_out        = 5,
        border_size     = 4,
        resize_on_border = true,
        layout          = "dwindle", -- master|dwindle

        col = {
            inactive_border = "rgb(000000)",
            inactive_border = "rgba(595959aa)",
            active_border   = "rgba(ff5e81ac)",
            inactive_border = "rgba(66333333)",
            active_border   = primary, -- Sources color from eww
            -- fix this
            -- apply_sens_to_raw = 0, -- whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
        },
    },
})
