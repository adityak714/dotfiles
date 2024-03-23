autoload -Uz vcs_info
precmd() { vcs_info }

export LSCOLORS=cxfxcxdxbxegedabagacad

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%(?.%F{green}√.%F{red}%?)%f %F{250}%1~%f %# '

# Shortcuts to simplify command-line experience
alias vim='nvim'
alias gst='git status'
alias l='ls -lGH'
alias ls='ls --color -GH'
alias c='clear'
alias x='exit'
alias la='ls -ail'
alias t='tmux'

# Start shell in a tmux window 
if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

# Initialize the command line with system data
export PF_INFO="title os host kernel uptime pkgs memory"
printf "\n"
pfetch
