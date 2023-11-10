abbr --add v nvim
abbr --add vim nvim
abbr --add sconf nvim $XDG_CONFIG_HOME/fish
abbr --add shit --position anywhere "sudo $history[1]"
abbr --add !! --position anywhere "$history[1]"
abbr --add opn xdg-open
abbr --add fzf-help fzf_configure_bindings --help
abbr --add df df -h
abbr --add ip inxi --ip
abbr --add cat bat -p
abbr --add less bat
abbr --add ip4 curl -sS4 ip.sb
abbr --add ip6 curl -sS6 ip.sb
abbr --add top btop
abbr --add htop top
abbr abbr-persist --set-cursor "echo abbr --add % >> $__fish_config_dir/conf.d/abbr.fish"
abbr alias "abbr-persist"

function edit_file
    echo $EDITOR $argv
end
# call txt files like a program then opening them in vim
abbr -a edit_texts --position command --regex ".+\.txt" --function edit_file

# nice example
# abbr 4DIRS --set-cursor=! "$(string join \n -- 'for dir in */' 'cd $dir' '!' 'cd ..' 'end')"
