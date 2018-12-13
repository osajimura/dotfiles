export PATH=/sbin:/bin:/usr/local/bin:/usr/bin:/usr/sbin
export HISTTIMEFORMAT='%F %T '

export PS1="`/bin/hostname`$ "
export PAGER=less
export LANG=C
export LC_ALL=C
export EDITOR=vi
export TERM=screen-256color

alias ls='ls -aF'
alias view='/usr/local/Cellar/osajimura-macvim/HEAD/MacVim.app/Contents/MacOS/Vim'
stty stop undef
stty start undef

source /Users/ofujimura/.git-completion.bash

