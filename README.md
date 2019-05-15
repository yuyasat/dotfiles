## Setup
```
ln -sf ~/dotfiles/.bashrc ~/.bashrc
source ~/.bashrc

ln -sf ~/dotfiles/.vimrc ~/.vimrc
```

## load bashrc every login
```
vim .bash_profile
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
```

## Install tools
```bash
# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install wget
brew install wget
# Install highway
brew tap tkengo/highway
brew install highway
# Install pt
brew install pt
```
