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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook zsh)"

# anyenv
eval "$(anyenv init -)"

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home

# gopath
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$HOME/.goenv/bin:$PATH
eval "$(goenv init -)"

alias co="git co"
alias br="git br"
alias st="git st"
alias giff="git diff --color-words --word-diff-regex='\\w+|[^[:space:]]'"

alias bi="bundle install"
alias be="bundle exec"

alias ag="pt"
alias grep="grep --color=auto"

alias psql_start="docker start postgres966"
alias psql_stop="docker stop postgres966"
alias redis_start="docker start yuya-redis"
alias redis_stop="docker stop yuya-redis"

source $(brew --prefix nvm)/nvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yuyataki/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yuyataki/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yuyataki/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yuyataki/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export LDFLAGS="-L/usr/local/opt/libffi/lib"
