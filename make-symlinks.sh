if [ ! $1 ]; then
    echo no directory provided, using git/dotfiles
    dir=git/dotfiles
else
    dir=$1
fi

ln -s $dir/.bash
ln -s $dir/.bashrc
ln -s $dir/.zsh
ln -s $dir/.zshrc
ln -s $dir/.vim
ln -s $dir/.vimrc
ln -s $dir/.vimcrypt
ln -s $dir/.tmux.conf
ln -s $dir/.profile
