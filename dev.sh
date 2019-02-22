#!/usr/bin/bash
# ----------------------------------
# 工具包主体 tools main
# @author raydraw@gmail.com
# ----------------------------------

# 调用函数
_CALL_FUNCTION(){
    local fname="fun"
    for arg in $@; do
        fname="${fname}_${arg}"
        shift
        if is_fun_exists ${fname}; then
            if [ "$LOGFILE" = "" ]; then
                ${fname} $@
            else
                echo "------------------------------------------------" | tee -a $LOGFILE
                echo "$(date +"%F %T") 执行操作：${arg} $@" | tee -a $LOGFILE
                echo "------------------------------------------------" | tee -a $LOGFILE
                ${fname} $@ | tee -a $LOGFILE
            fi
            exit 0
        fi
    done
    ERR "无效的指令，请使用以下指令"
    for k in ${!DOC[@]}; do
        >&2 echo -e -n "\e[95m${k}\e[0;0m"
        eval "printf ' %.0s' {1..$((26 - ${#k}))}"
        >&2 echo -e "${DOC[$k]}"
    done
}

# --- 执行入口 -----------------------------------
ROOT=.
HOME=~

# 额外载入工具脚本
scripts=( )
for f in ${scripts[@]}; do



# 根据参数调用相应命令
_CALL_FUNCTION $@