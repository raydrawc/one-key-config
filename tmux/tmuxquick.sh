#!/bin/sh
# ----------------------------------
# 快速启动tmux并开启默认界面
# @author raydraw@gmail.com
# ----------------------------------

cmd=$(which tmux)           # tmux path
session=work                # session name
window=monitor
work_path=/data/xxwy.dev/
work_platform=raydraw
work_zone_id=1

if [ -z $cmd ]; then
  echo "You need to install tmux."
  exit 1
fi

$cmd has-session -t $session >/dev/null 2>&1      ## test seesion exit
if [ $? != 0 ]; then
    $cmd new-session -s  $session -n  $window -d -c "${work_path}"
    $cmd split-window -h  -t $session:$window.0 -c "${work_path}"
    $cmd split-window -v  -t $session:$window.0 -c "${work_path}"
    $cmd send-keys -t $seesion:$window.2 "./dev.sh server start $work_platform $work_zone_id" C-m
    $cmd send-keys -t $seesion:$window.1 "sleep 5s" C-m
    $cmd send-keys -t $seesion:$window.1 "./dev.sh remsh  $work_platform $work_zone_id" C-m
    $cmd send-keys -t $seesion:$window.0 "./dev.sh server mmake" C-m
    $cmd select-pane -t $session:$window.0
fi

$cmd attach -t $session

exit 0