#!/bin/bash
#--------------------------------------
# 配置安装脚本
# @author raydrawc@gmail.com
#--------------------------------------
if [ "" == "$ROOT" ]; then
    echo -e "\e[91m>>\e[0;0m 此脚本必须通过tools/dev.sh调用才能正常工作"
    exit 1
fi

INSTALL_ROOT=~/myconfig/


DOC[vim]="安装个性化配置"
fun_vim() {
    mkdir -p $INSTALL_ROOT
    git clone 
}

