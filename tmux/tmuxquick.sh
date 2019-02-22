#!/bin/sh
# ----------------------------------
# 快速启动tmux并开启默认界面
# @author raydraw@gmail.com
# ----------------------------------

cmd=$(which tmux)           # tmux path
session=work                # session name
work_path=/data/xxwy.dev/

if [ -z $cmd ]; then
  echo "You need to install tmux."
  exit 1
fi

$cmd has-session -t $session >/dev/null 2>&1      ## test seesion exit
if [ $? != 0 ]; then
    $cmd new-session -s  $session -n  monitor -d -c "${work_path}"
    $cmd split-window -h  -t $session:monitor.0 -c "${work_path}"
    $cmd split-window -v  -t $session:monitor.0 -c "${work_path}"
    $cmd select-window -t $session:monitor.2
fi

$cmd attach -t $session

exit 0