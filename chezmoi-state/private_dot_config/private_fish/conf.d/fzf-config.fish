abbr --add fzf-help fzf_configure_bindings --help

if status is-interactive
    # fzf directory
    set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
    set fzf_directory_opts --bind "ctrl-x:execute(xdg-open {} &> /dev/tty)"
end
