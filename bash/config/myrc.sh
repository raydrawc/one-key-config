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

export SCREENDIR=$HOME/.screen
[ -d $SCREENDIR ] || mkdir -p -m 700 $SCREENDIR

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

## 设置文件过滤
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,cbin,ebin} --type f"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


alias sobash="source ~/.bashrc"

## 引入常用工具列表
export PATH=$PATH:~/tools

alias cman='man -M /usr/local/share/man/zh_CN'

