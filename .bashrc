source ~/dotfiles/.git-completion.sh
source ~/dotfiles/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
export PS1='\[\033[32m\]\t:\[\033[36m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias co="git co"
alias br="git br"
alias st="git st"
alias giff="git diff --color-words --word-diff-regex='\\w+|[^[:space:]]'"
