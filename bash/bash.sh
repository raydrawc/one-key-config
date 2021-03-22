#!/usr/bin/env bash
#--------------------------------------
# 工具列脚本
# @author raydrawc@gmail.com
#--------------------------------------

DOC[set_bash]="设置bash相关配置"
function fun_set_bash() {
    today=`date +%Y%m%d`
    cfg_path=$ROOT/bash/config/
    for file in `ls $cfg_path` 
    do
        filetmp=~/.$file
        if [[ -e $filetmp ]]
        then # 备份配置
            mv -f $filetmp $filetmp.today
        fi
        ln -s $cfg_path/$file $filetmp
    done
}

