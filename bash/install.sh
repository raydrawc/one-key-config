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
    cfgs=("bashrc" "myrc.sh" "profile")
    for file in ${cfgs[@]};
    do
        filetmp=~/.$file
        if [[ -e $filetmp ]];
        then # 备份配置
            mv -f $filetmp $filetmp.$today
        fi
        unlink $filetmp
        ln -s $cfg_path/$file $filetmp
    done
}


DOC[set_git]="设置git相关配置"
function fun_set_git() {
    today=`date +%Y%m%d`
    cfg_path=$ROOT/config/
    cfgs=("gitconfig")
    for file in ${cfgs[@]};
    do
        filetmp=~/.$file
        if [[ -e $filetmp ]];
        then # 备份配置
            mv -f $filetmp $filetmp.$today
        fi
        unlink $filetmp
        ln -s $cfg_path/$file $filetmp
    done
}

