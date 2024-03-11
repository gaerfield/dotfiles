abbr --add v nvim
abbr --add vim nvim
abbr --add sconf nvim $__fish_config_dir
abbr --add shit --position anywhere "sudo $history[1]"
abbr --add !! --position anywhere "$history[1]"
abbr --add !!c "echo $history[1] | wl-copy"
abbr --add opn xdg-open
abbr --add fzf-help fzf_configure_bindings --help
abbr --add df df -h
if type -q bat
    abbr --add less bat
end
abbr --add ip4 curl -sS4 ip.sb
abbr --add ip6 curl -sS6 ip.sb
abbr --add top btop
abbr --add htop top
abbr abbr-persist --set-cursor "echo abbr --add % >> $__fish_config_dir/conf.d/abbr.fish"
abbr alias "abbr-persist"

abbr --add scan-network --set-cursor "nmap -sV -open -oG scan-result.log -p %22 172.20.0.0/24"

function edit_file
    echo $EDITOR $argv
end
# call txt files like a program then opening them in vim
abbr -a edit_texts --position command --regex ".+\.txt" --function edit_file

# nice example
# abbr 4DIRS --set-cursor=! "$(string join \n -- 'for dir in */' 'cd $dir' '!' 'cd ..' 'end')"

abbr --add code codium
abbr --add c wl-copy
abbr --add p wl-paste
abbr --add scpr rsync -avz --info=progress2 --human-readable
abbr --add netstat ss
abbr --add tldr tealdeer

