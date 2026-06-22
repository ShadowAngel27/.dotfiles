hl.monitor({
    output   = "eDP-2",
    mode     = "2560x1600@165",
    position = "0x0",
    scale    = 1,
})

-- Fallback for any unlisted monitor (e.g. future external display)
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})
