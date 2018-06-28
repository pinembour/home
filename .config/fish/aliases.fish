
# Aliases
alias ll="ls --color=auto -alh"
alias ls="ls --color=auto -h"
alias grep="grep --color=auto"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias full-update="update ; and upgrade"
alias i="sudo apt install"
alias purge="sudo apt-get purge"
alias s="apt-cache search"
alias S="yaourt -S"
alias less="less -r"
alias unzip-all="7z x -y '*.zip'"
alias zshrc="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# System aliases
alias reboot="sudo reboot"
alias CleanKernel="dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p' | xargs sudo apt-get -y purge"

# Git aliases
alias st="git status"
alias clone="git clone"

alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'
alias rm='rm --interactive=once'
alias cp='cp --interactive'
alias mv='mv --interactive'
alias performance='sudo cpufreq-set -g performance'
alias powersave='sudo cpufreq-set -g powersave'
alias teppelin='ssh teppelin'
alias avalon='ssh avalonia.ovh'
alias nyanpasu='cd /mnt/d/Nyanpasu ; and youtube-dl "https://www.youtube.com/playlist?list=PLbnAI7EY6BhyLSoTKuFi10VwbmTHKCNt8" ; and mid3v2 --TPE2 "Nyanpasu" --album "Nyanpasu" *.mp3 ; and cd ~'
alias pp='cd /mnt/d/pp ; and youtube-dl "https://www.youtube.com/playlist?list=PLbnAI7EY6BhzSfSEgCRY-TQT65HBU61c3" ; and mid3v2 --TPE2 "pp" --album "pp" *.mp3 ; and cd ~'
alias shinkansen='cd /mnt/d/Shinkansen ; and youtube-dl "https://www.youtube.com/playlist?list=PLbnAI7EY6Bhyk9HoA56oygTPdo7bIGwAt" ; and mid3v2 --TPE2 "Shinkansen" --album "Shinkansen" *.mp3 ; and cd ~'
alias Shinkansen='shinkansen'
alias Nyanpasu='nyanpasu'
alias Pp='pp'
alias PP='pp'
