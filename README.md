## Setup
```
ln -sf ~/dotfiles/.bashrc ~/.bashrc
source ~/.bashrc

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
* -s: symbolic link
* -f: force
```

## load bashrc every login
```
vim .bash_profile
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
```

## For vim
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
# Install git and set config
brew install git
git config --global pager.log 'diff-highlight | less'
git config --global pager.show 'diff-highlight | less'
git config --global pager.diff 'diff-highlight | less'
git config --global interactive.diffFilter 'diff-highlight'
git config --global diff.compactionHeuristic true
```
