-- Ekran laptopa (Acer Nitro)
hl.monitor({
    output   = "eDP-2",
    mode     = "2560x1600@165",
    position = "0x0",
    scale    = 1.25,
})

-- Nowy monitor QD-OLED 240Hz po HDMI 2.1
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440@240",
    position = "2048x0",
    scale    = 1,n
})

-- Fallback for any other unlisted monitor
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})