#!/bin/bash
#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#Zsh configuration
mv ~/.zshrc ~/.zshrc.backup
cp ./zsh/zshrc ~/.zshrc
mv ~/.oh-my-zsh/themes/gnzh.zsh-theme ~/.oh-my-zsh/themes/gnzh.zsh-theme.bakup
cp ./zsh/gnzh.zsh-theme ~/.oh-my-zsh/themes/
#Vim configuration
mv ~/.vimrc ~/.vimrc_backup
cp ./vim/vimrc ~/.vimrc
cp -r ./vim/autoload ~/.vim/
cp -r ./vim/bundle ~/.vim/
#Tools
mkdir ~/tools
cp ./tools/bytefotmatter.sh ~/tools

source ~/.zshrc
