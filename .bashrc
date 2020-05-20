export PATH=/sbin:/bin:/usr/local/bin:/usr/bin:/usr/sbin
export HISTTIMEFORMAT='%F %T '

export LANG=ja_JP.UTF-8
export PS1="\u@\h:\w$ "
export PAGER=less
export EDITOR=vi
export TERM=screen-256color
export BAT_THEME="Nord"
export RIPGREP_CONFIG_PATH=~/.ripgreprc

alias ls='ls -aFG'
alias nssh='ssh -lnutanix'
stty stop undef
stty start undef
