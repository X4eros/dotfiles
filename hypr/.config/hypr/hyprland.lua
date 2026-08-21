---@module 'hl'

-- Hyprland Configuration

-- https://wiki.hypr.land/Configuring/

-- ==================

-- MONITOR CONFIG

-- ==================

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
    bitdepth = 10,
})

-- ==================

-- STARTUP APPS

-- ==================

hl.on("hyprland.start", function()
    hl.exec_cmd("dms run")
    hl.exec_cmd("dex -a")
    hl.exec_cmd("xhost +si:localuser:root")
end)

-- ==================

-- ENV VARIABLES

-- ==================

hl.env("QT_QPA_PLATFORM", "wayland;xcb")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.env("QT_QPA_PLATFORMTHEME_QT6", "qt6ct")

hl.env("TERMINAL", "kitty")

hl.env("LIBVA_DRIVER_NAME", "nvidia")

hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("NVD_BACKEND", "direct")

-- ==================

-- INPUT CONFIG

-- ==================

hl.config({
    input = {
        kb_layout = "tr",
        numlock_by_default = true,
    },
})

hl.config({
    binds = {
        scroll_event_delay = 0,
    },
})

-- ==================

-- GENERAL LAYOUT

-- ==================

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        layout = "scrolling",
        allow_tearing = true,
    },
})

hl.config({
    render = {
        direct_scanout = 0,
    },
})

-- ==================

-- DECORATION

-- ==================

hl.config({
    decoration = {
        rounding = 12,
        active_opacity = 1,
        inactive_opacity = 0.9,
        blur = {
            enabled = true,
            size = 10,
            passes = 4,
            xray = true,
            noise = 0.02,
            contrast = 1.1,
            vibrancy = 0.2,
            vibrancy_darkness = 0.3,
        },
        shadow = {
            enabled = true,
            range = 30,
            render_power = 5,
            offset = "0 5",
            color = "rgba(00000070)",
        },
        motion_blur = {
            enabled = true,
        },
    },
})

-- ==================

-- ANIMATIONS

-- ==================

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("rubber", { type = "spring", mass = 1, stiffness = 400, dampening = 33 })
hl.curve("rubberfast", { type = "spring", mass = 1, stiffness = 650, dampening = 40 })
hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })

hl.animation({ leaf = "workspaces", enabled = true, speed = 10, spring = "rubberfast", style = "slidevert" })
hl.animation({ leaf = "windows", enabled = true, speed = 10, spring = "rubber", style = "popin" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, spring = "rubber" })

-- ==================

-- LAYOUTS

-- ==================

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        mfact = 0.5,
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = false,
        explicit_column_widths = "0.5, 1.0",
    },
})

-- ==================

-- MISC

-- ==================

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 1,
    },
})

-- GNOME apps
hl.window_rule({ match = { class = "^(org\\.gnome\\.)" }, border_size = 0, rounding = 12 })

-- Floating windows
hl.window_rule({ match = { class = "^(gnome-calculator)$" }, float = true })

hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })

hl.window_rule({ match = { class = "^(org\\.gnome\\.Nautilus)$" }, float = true })

-- Open DMS windows as floating by default
hl.window_rule({ match = { class = "^(org.quickshell)$" }, float = true })

require("dms/colors")

require("dms/layout")

require("dms/cursor")

require("dms/binds")

require("dms/binds-user")

require("dms.outputs")

require("dms.windowrules")
