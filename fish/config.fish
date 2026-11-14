    source /usr/share/cachyos-fish-config/cachyos-config.fish

    # overwrite greeting
    # potentially disabling fastfetch
    #function fish_greeting
    #    # smth smth
    #end



# starship prompt (transient)
function starship_transient_prompt_func
    starship module character
end
function starship_transient_rprompt_func
    starship module time
end
starship init fish | source
enable_transience
