-- ── Apps ─────────────────────────────────────────────────────────────────────
hl.bind("SUPER + SPACE",     hl.dsp.exec_cmd("rofi -show drun -theme ~/.config/rofi/spotlight.rasi"))
hl.bind("SUPER + Q",         hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + B",         hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + E",         hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("alacritty -e yazi"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("vesktop"))
hl.bind("SUPER + G",         hl.dsp.exec_cmd("godots"))
hl.bind("SUPER + V",         hl.dsp.exec_cmd("bash -c 'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'"))

-- ── Screenshots ───────────────────────────────────────────────────────────────
hl.bind("PRINT",             hl.dsp.exec_cmd("bash -c 'grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png'"))
hl.bind("SHIFT + PRINT",     hl.dsp.exec_cmd("bash -c 'grim ~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png'"))
hl.bind("CTRL + PRINT",      hl.dsp.exec_cmd("bash -c 'grim -g \"$(slurp)\" - | wl-copy'"))

-- ── Window Actions ────────────────────────────────────────────────────────────
hl.bind("SUPER + C",         hl.dsp.window.close())
hl.bind("SUPER + F",         hl.dsp.window.fullscreen())
hl.bind("SUPER + X",         function() hl.dispatch(hl.dsp.window.float({ action = "toggle" })) end)
hl.bind("SUPER + P",         hl.dsp.window.pseudo())
hl.bind("SUPER + J",         hl.dsp.layout("togglesplit"))

-- ── System ────────────────────────────────────────────────────────────────────
hl.bind("SUPER + ESCAPE",    hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + M",         hl.dsp.exec_cmd("hyprshutdown"))

-- ── Focus Navigation ──────────────────────────────────────────────────────────
hl.bind("SUPER + left",      hl.dsp.focus({ direction = "left"  }))
hl.bind("SUPER + right",     hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",        hl.dsp.focus({ direction = "up"    }))
hl.bind("SUPER + down",      hl.dsp.focus({ direction = "down"  }))
hl.bind("ALT + TAB", function()
    hl.exec_cmd("hyprctl dispatch cyclenext")
    hl.exec_cmd("hyprctl dispatch bringactivetotop")
end)
hl.bind("ALT + TAB", hl.dsp.exec_cmd("notify-send 'alt tab works'"))



-- ── Workspaces ────────────────────────────────────────────────────────────────
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + S",          hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S",  hl.dsp.window.move({ workspace = "special:magic" }))

-- ── Mouse ─────────────────────────────────────────────────────────────────────
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273",  hl.dsp.window.resize(), { mouse = true })

-- ── Multimedia ────────────────────────────────────────────────────────────────
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%+"),                   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%-"),                   { locked = true, repeating = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),                                   { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"),                             { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"),                             { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),                               { locked = true })
