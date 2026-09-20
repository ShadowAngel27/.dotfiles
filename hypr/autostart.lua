-- ── Wallpaper mode ──────────────────────────────────────────────────────────
-- "static"  → hyprpaper, image on both monitors
-- "animated" → mpvpaper, video on eDP-2 only (HDMI-A-1 stays static via hyprpaper)
local WALLPAPER_MODE = "static"

local WALLPAPER_IMAGE = "/home/shadow_angel/Pictures/Wallpapers/wallpaper.jpg"
local WALLPAPER_VIDEO = "/home/shadow_angel/Pictures/Wallpapers/animated.mp4"

local function start_wallpaper()
    hl.exec_cmd("pkill hyprpaper")
    hl.exec_cmd("pkill mpvpaper")

    if WALLPAPER_MODE == "animated" then
        -- hyprpaper handles the static monitor (HDMI-A-1)
        local configFile = io.open(os.getenv("HOME") .. "/.config/hypr/hyprpaper.conf", "w")
        if configFile then
            configFile:write("wallpaper {\n")
            configFile:write("    monitor = HDMI-A-1\n")
            configFile:write("    path = " .. WALLPAPER_IMAGE .. "\n")
            configFile:write("    fit_mode = cover\n")
            configFile:write("}\n")
            configFile:write("splash = false\n")
            configFile:write("ipc = true\n")
            configFile:close()
        end
        hl.exec_cmd("hyprpaper &")
        hl.exec_cmd("sleep 1 && mpvpaper -o 'loop no-audio hwdec=auto' eDP-2 " .. WALLPAPER_VIDEO .. " &")
    else
        -- static: hyprpaper handles both monitors, mpvpaper stays off
        local configFile = io.open(os.getenv("HOME") .. "/.config/hypr/hyprpaper.conf", "w")
        if configFile then
            configFile:write("wallpaper {\n")
            configFile:write("    monitor = eDP-2\n")
            configFile:write("    path = " .. WALLPAPER_IMAGE .. "\n")
            configFile:write("    fit_mode = cover\n")
            configFile:write("}\n")
            configFile:write("wallpaper {\n")
            configFile:write("    monitor = HDMI-A-1\n")
            configFile:write("    path = " .. WALLPAPER_IMAGE .. "\n")
            configFile:write("    fit_mode = cover\n")
            configFile:write("}\n")
            configFile:write("splash = false\n")
            configFile:write("ipc = true\n")
            configFile:close()
        end
        hl.exec_cmd("hyprpaper &")
    end
end

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start graphical-session.target")

    hl.exec_cmd("hyprpolkitagent &")
    hl.exec_cmd("swaync &")
    hl.exec_cmd("swayosd-server -s ~/.config/swayosd/style.css --config ~/.config/swayosd/config.toml &")

    -- Audio
    hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@   18%")
    hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 30%")

    -- Keyboard RGB
    -- hl.exec_cmd("echo '1b003a,1b003a,1b003a,1b003a,100' | sudo tee /sys/devices/platform/acer-wmi/four_zoned_kb/per_zone_mode")
    hl.exec_cmd("sh -c \"echo '1b003a,1b003a,1b003a,1b003a,100' | sudo tee /sys/devices/platform/acer-wmi/four_zoned_kb/per_zone_mode\"")
    start_wallpaper()

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