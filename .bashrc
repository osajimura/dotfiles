export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:~/local/bin:/usr/local/bin:/sbin:/bin:/usr/bin:/usr/sbin"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export HISTTIMEFORMAT='%F %T '

# show git branch
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

if [ ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# prompt coloring
# 1. Remote (Diamond): Highlight nickname and working directory
# NICKNAME:             95m Light Magenta
# Working directory:    94m Light Blue
#
# 2. Local: Highlight working directory and current branch 
# User and hostname:    39m Default foreground color 
# Working directory:    94m Light Blue
# Current Branch:       90m Dark Gray

if [ $NICKNAME ]; then
    export PS1='\u@\[\e[95m\]$NICKNAME\[\e[0m\]:\[\e[94m\]\w\[\e[0m\]$ '
else
    export PS1='\[\e[39m\]\u@\h\[\e[00m\]\[\e[00m\]:\[\e[94m\]\w\[\e[00m\]\[\e[1;90m $(__git_ps1 "(%s)")\[\e[00m\]$ '
fi

export LANG=ja_JP.UTF-8
export LC_MESSAGES="C"
export PAGER=less
export EDITOR=vi
export TERM=screen-256color
export BAT_THEME="Nord"
export RIPGREP_CONFIG_PATH=~/.ripgreprc
alias ls='ls -aFG'
alias nssh='ssh -lnutanix'

# Disabling Ctrl + S and Ctrl + Q. See stty -a for defails.
stty stop undef
stty start undef

# gb - checkout git branch
gb() {
    local branches branch
    branches=$(git branch) &&
    branch=$(echo "$branches" | fzf-tmux +m) &&
    git checkout $(echo "$branch" | awk '{print $1}')
}

# gbr - checkout git branch from remote branch
gbr() {
    local branches branch
    branches=$(git branch -r) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout -b $(echo "$branch" | awk '{print $1}' | cut -d "/" -f2) $(echo "$branch" | awk '{print $1}')
}

# key binding for gb
bind '"\C-g": "gb \n"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

