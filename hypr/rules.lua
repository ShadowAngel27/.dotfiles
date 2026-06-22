hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({ name = "float-pavucontrol", match = { class = "^pavucontrol$"          }, float = true })
hl.window_rule({ name = "float-blueman",     match = { class = "^blueman-manager$"      }, float = true })
hl.window_rule({ name = "float-nm",          match = { class = "^nm-connection-editor$" }, float = true })

-- ── Permissions (uncomment for screensharing / OBS / Vesktop) ─────────────────
hl.config({ ecosystem = { enforce_permissions = true } })
hl.permission("/usr/(bin|local/bin)/grim",                             "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm",                           "plugin",     "allow")
