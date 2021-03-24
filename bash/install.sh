#!/usr/bin/env bash
#--------------------------------------
# 安装工具
# @author raydraw@163.com
#--------------------------------------

DOC[install]="辅助一键安装"
function fun_install(){
    fun_set_bash

}

DOC[set_bash]="设置bash相关配置"
function fun_set_bash() {
    today=`date +%Y%m%d`
    cfg_path=$ROOT/config/
    confgs=("bashrc", "myrc.sh", "profile")
    for file in ${config[@]};
    do
        filetmp=~/.$file
        if [[ -e $filetmp ]]
        then # 备份配置
            mv -f $filetmp $filetmp.today
        fi
        ln -s $cfg_path/$file $filetmp
    done
}

DOC[set_tmux]="配置tmux配置"
function fun_set_tmux() {
    today=`date +%Y%m%d`
    cfg_path=$ROOT/bash/config/
    confgs=("tmux.conf")
    for file in ${config[@]};
    do
        filetmp=~/$file
        if [[ -e $filetmp ]]
        then # 备份配置
            mv -f $filetmp $filetmp.today
        fi
        ln -s $cfg_path/$file $filetmp
    done
}


DOC[set_git]="配置git配置"
function fun_set_git() {
    today=`date +%Y%m%d`
    cfg_path=$ROOT/bash/config/
    confgs=("gitconfig")
    for file in ${config[@]};
    do
        filetmp=~/.$file
        if [[ -e $filetmp ]]
        then # 备份配置
            mv -f $filetmp $filetmp.today
        fi
        ln -s $cfg_path/$file $filetmp
    done
}

