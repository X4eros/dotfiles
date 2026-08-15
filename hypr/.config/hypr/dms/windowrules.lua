-- DMS Window Rules — managed by DankMaterialShell
-- Do not edit manually; changes may be overwritten

-- DMS-RULE: id=wr_1786411909838691333, name=com.danklinux.dms
hl.window_rule({ match = { class = "^com.danklinux.dms$" }, float = true })

-- DMS-RULE: id=wr_1786412919465421473, name=org.kde.kdeconnect.daemon
hl.window_rule({ match = { class = "^org.kde.kdeconnect.daemon$" }, float = true, no_blur = true })

-- DMS-RULE: id=dms-floating-windows, name=DMS Floating Windows
hl.window_rule({ match = { class = "^com.danklinux.dms$" }, float = true })
