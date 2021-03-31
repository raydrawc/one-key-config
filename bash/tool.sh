#!/usr/bin/env bash
#--------------------------------------
# 工具列脚本
# @author raydrawc@gmail.com
#--------------------------------------


DOC[set_erl_link]="辅助设置wsl的erl_link"
function fun_set_erl_link() {
    if [[ $# -eq 0 ]];  then 
        ERR "无效的指令，请输入erl_bin路径"
    elif [[ -d $1 ]]; then
        files=("erl" "erlc" "werl" "escript" "dialyzer" )
        EPATH=$1;
        for file in ${files[@]}; do
            [[ -L $EPATH/$file ]] && unlink $EPATH/$file
            ln -s $EPATH/$file.exe $EPATH/$file
        done
    else
        ERR "无效的指令，请输入有效erl_bin路径"
    fi
}


