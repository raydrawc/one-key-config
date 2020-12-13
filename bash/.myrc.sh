# -----------------------
# 自定义bashrc
# ----------------------
## 工作作者邮箱
export author="raydrawc@gmail.com" 

# function git_branch {
#    branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
#    if [ "${branch}" != "" ];then
#        if [ "${branch}" = "(no branch)" ];then
#            branch="(`git rev-parse --short HEAD`...)"
#        fi
#        echo " ($branch)"
#    fi
# }
# # 重置输出栏
# export PS1='\[\033[0;32m\]\u@\h:\[\033[01;36m\]\W\[\033[01;32m\]$(git_branch)\[\033[00m\] \$ '
# 配置erlang启动环境
ERL_HOME=/usr/local/erlang/using/bin
export PATH=$PATH:$ERL_HOME

export SCREENDIR=$HOME/.screen
[ -d $SCREENDIR ] || mkdir -p -m 700 $SCREENDIR

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

## 设置文件过滤
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,cbin,ebin} --type f"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


## 工作区快捷跳转
xxwy=/data/xxwy.dev
alias cxx="cd /data/xxwy.dev/"
alias cxxs="cd /data/xxwy.dev/server/"
alias cxxt="cd /data/xxwy.dev/tools/"
alias vscreen="vim /data/xxwy.dev/zone/xxwy_raydraw_1/screenlog.0"

alias mmup="$xxwy/dev.sh server mmake && $xxwy/dev.sh server update raydraw 1"
alias mm="$xxwy/dev.sh server mmake"

alias devgd="$xxwy/dev.sh gen_data"
alias devgp="$xxwy/dev.sh gen_proto"
alias xxdev="$xxwy/dev.sh"

alias sobash="source ~/.bashrc"

## 引入常用工具列表
export PATH=$PATH:/home/raydraw/tools

alias cman='man -M /usr/local/share/man/zh_CN'

export ALL_PROXY="socks5://127.0.0.1:7380" 
