#!/usr/bin/env bash
#--------------------------------------
# ssh相关脚本
# @author raydrawc@gmail.com
#--------------------------------------
if [ "" == "$ROOT" ]; then
    echo -e "\e[91m>>\e[0;0m 此脚本必须通过tools/dev.sh调用才能正常工作"
    exit 1
fi

DOC[creat_key]="创建新的ssh-key"
function  fun_creat_key() {
  ssh-keygen -t rsa -C "root@mail.com"
}

echo "hello"

