-- Laptop panel (left)
hl.monitor({
    output   = "desc:AU Optronics 0xCDAB",
    mode     = "2560x1600@165",
    position = "0x0",
    scale    = 1.25,
})

-- Alienware AW2726DM (main)
hl.monitor({
    output   = "desc:Dell Inc. AW2726DM 491ZWF4",
    mode     = "2560x1440@120",
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
-- Na HDMI 2.1 w Linuksie maks dla tego modelu to zazwyczaj 120Hz/144Hz (dla 240Hz wymagany jest DisplayPort / USB-C DP Alt-Mode)