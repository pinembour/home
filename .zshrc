# Created by newuser for 4.3.9
autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches found%b'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' menu select=2
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                           /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
fpath=(~/.zsh/functions $fpath)

autoload -U promptinit
promptinit
prompt adam2

autoload -U bashcompinit
bashcompinit

export HISTSIZE=2000
export HISTFILE=$HOME/.history
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt extendedglob
setopt clobber

# Binkeys
typeset -A key
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[2~" beep
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi


case $TERM in
   xterm*)
       precmd () {print -Pn "\e]0;%n@%m: %~\a"}
       ;;
esac

srv(){
   sudo /etc/init.d/$1 $2
}
compdef _service srv

export SDL_NOMOUSE=1

# Set title to GNU screen/byobu tab
settitle() {
    if [ "$TERM" = "screen" ];
    then
        printf "\033k$1\033\\";
    fi
}

# Set title when sshing within a tab to some host
ssh() {
    host=$(echo "$*" | sed "s/^.\+@\([^ ]\+\)[ \n]*.*/\1/")
    settitle $host
    command ssh "$@"
    settitle $(hostname)
}

_script()
{

  local cur
  COMPREPLY=()
  words="${COMP_WORDS[COMP_CWORD]}"

  _script_commands=$(net ${COMP_WORDS[1]} shortlist)

  COMPREPLY=( $(compgen -W "${_script_commands}") )

  return 0
}
complete -o nospace -F _script net
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


source ~/.aliases
