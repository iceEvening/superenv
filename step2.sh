#!/bin/zsh
#Zsh configuration
if [ -f "/root/.zshrc" ]; then
    mv ~/.zshrc ~/.zshrc.backup
fi
cp ./zsh/zshrc ~/.zshrc
mv ~/.oh-my-zsh/themes/gnzh.zsh-theme ~/.oh-my-zsh/themes/gnzh.zsh-theme.bakup
cp ./zsh/gnzh.zsh-theme ~/.oh-my-zsh/themes/

source ~/.zshrc

#Tools
mkdir ~/tools
cp ./tools/byteformatter.sh ~/tools

#Vim configuration
if [ -f "/root/.vimrc" ]; then
    mv ~/.vimrc ~/.vimrc_backup
fi
cp ./vim/vimrc ~/.vimrc
mkdir -p ~/.vim/bundle && cd ~/.vim/bundle
git clone https://github.com/Shougo/neocomplete.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/fatih/vim-go.git

#Remove old vim & Install new vim with lua
sudo apt-get remove vim vim-runtime  vim-tiny vim-common vim-gui-common
sudo apt-get purge vim vim-runtime  vim-tiny vim-common vim-gui-common
sudo apt-get install luajit libluajit-5.1 libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
cd /tmp
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
--enable-cscope \
--enable-rubyinterp \
--enable-largefile \
--disable-netbeans \
--enable-pythoninterp \
--with-python-config-dir=/usr/lib/python2.7/config \
--enable-perlinterp \
--enable-luainterp \
--with-luajit -enable-fail-if-missing \
--with-lua-prefix=/usr \
--enable-gui=gnome2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
sudo make install
mkdir -p ~/.vim/autoload && cp -r /tmp/superenv/vim/autoload ~/.vim/
