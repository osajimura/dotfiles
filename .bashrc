export PATH=~/local/bin:/sbin:/bin:/usr/local/bin:/usr/bin:/usr/sbin
export HISTTIMEFORMAT='%F %T '

# show git branch
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh

if [ $NICKNAME ]; then
    export PS1='\u@\[\e[1;91m\]$NICKNAME\[\e[0m\]:\[\e[94m\]\w$ '
else
    export PS1='\[\e[39m\]\u@\h\[\e[00m\]\[\e[00m\]:\[\e[94m\]\w\[\e[00m\]\[\e[1;90m $(__git_ps1 "(%s)") \[\e[00m\]$ '
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
