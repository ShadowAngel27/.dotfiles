hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user start graphical-session.target")

    hl.exec_cmd("hyprpolkitagent &")
    hl.exec_cmd("swaync &")
    hl.exec_cmd("swayosd-server -s ~/.config/swayosd/style.css --top-margin 0.05 &")

    -- Audio
    hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@   18%")
    hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 30%")

    -- Wallpaper config
    local configFile = io.open(os.getenv("HOME") .. "/.config/hypr/hyprpaper.conf", "w")
    if configFile then
        configFile:write("wallpaper {\n")
        configFile:write("    monitor = eDP-2\n")
        configFile:write("    path = /home/shadow_angel/Pictures/Wallpapers/wallpaper.jpg\n")
        configFile:write("    fit_mode = cover\n")
        configFile:write("}\n")
        configFile:write("splash = false\n")
        configFile:write("ipc = true\n")
        configFile:close()
    end

    hl.exec_cmd("hyprpaper &")
    hl.exec_cmd("waybar &")
    hl.exec_cmd("wl-paste --type text  --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")
    hl.exec_cmd("nm-applet &")
    hl.exec_cmd("udiskie &")
    hl.exec_cmd("hypr-kblayoutd &")
    hl.exec_cmd("hyprshade auto &")
    hl.exec_cmd("hyprctl setcursor capitaine-cursors 24")
    hl.exec_cmd("pkill -f kwin_wayland")
end)
