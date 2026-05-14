-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Enviroment Configuration                 ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- envd (delayed)
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_SIZE",    "24")
hl.env("QT_CURSOR_SIZE",  "24")

-- env
hl.env("MOZ_DISABLE_RDD_SANDBOX",       "1")
hl.env("EGL_PLATFORM",                  "wayland")
hl.env("MOZ_ENABLE_WAYLAND",            "1")
hl.env("QT_QPA_PLATFORMTHEME",          "qt5ct")
hl.env("QT_QPA_PLATFORM",              "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT",  "wayland")
