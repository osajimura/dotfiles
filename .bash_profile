export PATH=~/local/bin:/sbin:/bin:/usr/local/bin:/usr/bin:/usr/sbin
export HISTTIMEFORMAT='%F %T '

export LANG=ja_JP.UTF-8

if [ $NICKNAME ]; then
    export PS1="\u@$NICKNAME:\w$ "
else
    export PS1="\u@\h:\w$ "
fi

export LC_MESSAGES="C"
export PAGER=less
export EDITOR=vi
export TERM=screen-256color
export BAT_THEME="Nord"
export RIPGREP_CONFIG_PATH=~/.ripgreprc

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
