# Git
fpath=(~/.zsh $fpath)
if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
       zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi
if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
       source ${HOME}/.zsh/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# setopt PROMPT_SUBST ; PS1='[%D{%Y/%m/%d} %* %n@%m %c$(__git_ps1 " (%s)")]\$ '
setopt PROMPT_SUBST ; PS1='%F{green}%*%f %F{cyan}%c%f%F{red}$(__git_ps1 " (%s)")%f\$ '

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

# rbenv
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

# direnv
eval "$(direnv hook zsh)"

alias co="git co"
alias br="git br"
alias st="git st"

alias bi="bundle install"
alias be="bundle exec"

alias psql_start="docker start postgres966"
