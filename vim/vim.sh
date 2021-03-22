#!/bin/bash
#@author raydraw@gmail.com

## 获取当前文件绝对路径
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

mkdir ~/.vim/autoload -p
## 下载plug.vim 至 autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## 替换目标连接
if [[ -f ~/.vimrc ]]; or [[ -f ~/_vimrc]]; then 
    rm -f ~/.vimrc
    rm -f ~/_vimrc
    ln -s $SHELL_FOLDER/.vimrc ~/.vimrc
fi
