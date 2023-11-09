set fish_greeting                 # remove greeting on shell startup 

if status is-interactive
    zoxide init fish | source     # load z autojump plugin
end
