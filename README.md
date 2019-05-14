## Setup
```
ln -sf ~/dotfiles/.bashrc ~/.bashrc
source ~/.bashrc
```

## read bashrc every login
```
vim .bash_profile
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
```
