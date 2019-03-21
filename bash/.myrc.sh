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

export PATH=$PATH:/usr/local/erlang/using/bin
