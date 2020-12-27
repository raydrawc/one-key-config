#!/usr/bin/env bash
#--------------------------------------
# ssh相关脚本
# @author raydrawc@gmail.com
#--------------------------------------

DOC[bash_set]="设置bash相关配置"
function fun_bash_set() {
  # 备份原来设置
  if [ -f "$HOME/.bashrc.bc" ]; then
  mv "$Home/.bashrc" "$Home/.bashrc.bc"
  fi
  if [ -f "$HOME/.profile" ]; then
  mv "$Home/.profile" "$Home/.profile.bc"
  fi


}
