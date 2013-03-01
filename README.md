Vim configuration
=================

Move away the old vim configuration
```
mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old
```

Installation and configuration
```
git clone <url> ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s .vim/vimrc ~/.vimrc
```
