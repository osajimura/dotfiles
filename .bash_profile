export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:~/local/bin:/usr/local/bin:/sbin:/bin:/usr/bin:/usr/sbin"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
## kubectl bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

source ~/.bashrc
