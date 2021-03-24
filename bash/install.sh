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

