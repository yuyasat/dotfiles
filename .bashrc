source ~/dotfiles/.git-completion.sh
source ~/dotfiles/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1='\[\033[32m\]\t:\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
# Qt & postgresql
export PATH="$PATH:~/Qt5.5.1/5.5/clang_64/bin/:/usr/local/opt/postgresql@9.6/bin/"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook bash)"

alias co="git co"
alias br="git br"
alias st="git st"
alias giff="git diff --color-words --word-diff-regex='\\w+|[^[:space:]]'"

alias bi="bundle install"
