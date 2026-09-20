hl.monitor({
    output   = "eDP-2",
    mode     = "2560x1600@165",
    position = "0x0",
    scale    = 1.33,
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "3440x1440@99.98",
    position = "-440x-1440",
    scale    = 1,
})

-- Fallback for any other unlisted monitor
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})