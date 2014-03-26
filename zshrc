
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export editor="vim"
bindkey -v

#vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward 

setopt AUTO_CD


