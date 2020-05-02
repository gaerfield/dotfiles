# dotfiles

This Repository contains my dotfile-configurations managed by [yadm](https://yadm.io/) and [zinit](https://github.com/zdharma/zinit) and some of my main non-console-tools in linux.

## install
```
sudo apt update && sudo apt install git yadm zsh
yadm clone https://github.com/gaerfield/dotfiles.git --bootstrap
```

## Terminal

### most important fzf-commands
* C-R: search-command history
* C-T: search for file or folder adding to command-line
* A-C: change into directory in subtree
* fif <searchterm>: "find-in-file" does a recursive search including a preview window

### plugins managed by zplug
* Code-Search: [the platinum searcher](https://github.com/monochromegane/the_platinum_searcher)
* Log-File-Viewer: [lnav](http://lnav.org/)
* extract: (oh-my-zsh/extract)
* ripgrep: (BurntSushi/ripgrep)
* json-parser: (stedolan/jq)
* autojump with fasd:
  * main: clvv/fasd
  * oh-my-zsh/fasd
  * wookayin/fzf-fasd
* liangguohuan/fzf-marker
* command-line snippet manager: [Pet](https://github.com/knqyf263/pet)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)

### manual configuration
* [solarized gnome-terminal](https://github.com/Anthony25/gnome-terminal-colors-solarized)
* tmux config-framework: [byobu](http://byobu.co/)

### needs npm
* man-page in short: [tldr](https://github.com/tldr-pages/tldr)
* Stack overflow from terminal: [how2](https://github.com/santinic/how2)

### test in the future
* terminal file manager: [lf](https://github.com/gokcehan/lf)
* grml
* view images in console: catimg

# Non-Console Apps
* Clipboard-Manager: [CopyQ](https://github.com/hluk/CopyQ)
  ```
    sudo add-apt-repository ppa:hluk/copyq
    sudo apt update
    sudo apt install copyq
  ```
* [devdocs-desktop](https://github.com/egoist/devdocs-desktop)
* [Atom Editor](https://atom.io/)
* Password-Management: [Bitwarden](https://bitwarden.com/)
* [flameshot](https://github.com/lupoDharkael/flameshot)
  * screenshot command for keyboard-shortcut `flameshot gui -p $HOME/Bilder/screenshots`
* disk-usage-analyzer [baobab](https://wiki.gnome.org/action/show/Apps/DiskUsageAnalyzer)
* Offline Documentation Browser [zeal](https://zealdocs.org/)
