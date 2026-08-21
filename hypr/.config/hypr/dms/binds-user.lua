-- DMS user keybind overrides (edit via Control Center or dms; do not remove this header)

hl.unbind("SUPER + SHIFT + Escape")
hl.bind("SUPER + SHIFT + Escape", hl.dsp.exec_cmd("dms ipc call keybinds toggle hyprland"), { description = "dms ipc call keybinds toggle hyprland" })
hl.unbind("SUPER + B")
hl.bind("SUPER + B", hl.dsp.exec_cmd("helium-browser"), { description = "helium-browser" })
