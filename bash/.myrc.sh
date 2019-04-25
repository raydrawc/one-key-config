# -----------------------
# 自定义bashrc
# ----------------------
function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch)"
   fi
}
# 重置输出栏
export PS1='\[\033[0;32m\]\u@\h:\[\033[01;36m\]\W\[\033[01;32m\]$(git_branch)\[\033[00m\] \$ '
#配置erlang启动环境
ERL_HOME=/usr/local/erlang/using/bin
export PATH=$PATH:$ERL_HOME

xxwy=/data/xxwy.dev
alias cxx="cd /data/xxwy.dev/"
alias cxxs="cd /data/xxwy.dev/server/"
alias cxxt="cd /data/xxwy.dev/tools/"
alias vscreen="vim /data/xxwy.dev/zone/xxwy_raydraw_1/screenlog.0"

alias mmup="$xxwy/dev.sh server mmake && $xxwy/dev.sh server update raydraw 1"
