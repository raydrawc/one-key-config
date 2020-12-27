#!/usr/bin/env bash
# ----------------------------------
# 工具包主体 tools main
# @author raydraw@gmail.com
# ----------------------------------

# 获取脚本文件所在绝对路径(自动跟踪符号链接)
get_real_path(){
    local source="${BASH_SOURCE[0]}"
    while [ -h "$source" ]; do
        local dir="$( cd -P "$( dirname "$source" )" && pwd )"
        source="$( readlink "$source" )"
        [[ $source != /* ]] && source="$dir/$source"
    done
#    echo "$( cd -P "$( dirname "$source" )/.." && pwd )"
    echo "$( cd -P "$( dirname "$source" )" && pwd )"
}

# 调用函数
_CALL_FUNCTION(){
    local fname="fun"
    for arg in $@; do
        fname="${fname}_${arg}"
        shift
        if is_fun_exists ${fname}; then
            ${fname} $@
            exit 0
        fi
    done
    ERR "无效的指令，请使用以下指令"
    while [ ${#DOC[@]} -ne 0 ]; do
        mink=''
        for k in ${!DOC[@]}; do
            if [ "$mink" = "" ] || [[ "$mink" > "$k" ]]; then
                mink=$k
            fi
        done
        >&2 echo -e -n "\e[95m${mink}\e[0;0m"
        eval "printf ' %.0s' {1..$((26 - ${#mink}))}"
        >&2 echo -e "${DOC[$mink]}"
        unset DOC[$mink]
    done
}

# 输出一条普通信息
INFO(){
    echo -e "\e[92m=>\e[0;0m ${1}"
}

# 输出一条错误信息
ERR(){
    >&2 echo -e "\e[91m>>\e[0;0m ${1}"
}


# 输出命令行补全信息
fun_completion(){
    echo $(declare -p DOC)
}

# --- 执行入口 -----------------------------------
ROOT=$(get_real_path)
HOME=~

# 设置帮助文本
declare -A DOC

# 额外载入工具脚本
scripts=( "ssh/ssh.sh" )
for f in ${scripts[@]}; do
    if [ ! -f ${ROOT}/${f} ]; then
        continue
    fi
    source ${ROOT}/${f}
done

# 根据参数调用相应命令
_CALL_FUNCTION $@