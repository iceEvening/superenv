#!/bin/bash
#Install packages
sudo apt-get update && sudo apt-get install zsh git docker.io python-tk

#Install pip packages
export LC_ALL=C
pip install numpy scipy matplotlib paddlepaddle tensorflow pandas -i https://pypi.douban.com/simple

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
