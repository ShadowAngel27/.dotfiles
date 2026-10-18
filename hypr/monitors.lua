-- Ekran laptopa (Acer Nitro)
hl.monitor({
    output   = "eDP-2",
    mode     = "2560x1600@165",
    position = "0x0",
    scale    = 1.25,
})

-- Nowy monitor QD-OLED (Alienware AW2726DM)
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440@120", -- Na HDMI 2.1 w Linuksie maks dla tego modelu to zazwyczaj 120Hz/144Hz (dla 240Hz wymagany jest DisplayPort / USB-C DP Alt-Mode)
    position = "2048x0",
    scale    = 1,
})

-- Fallback for any other unlisted monitor
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})