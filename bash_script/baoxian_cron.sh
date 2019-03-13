#!/bin/bash
. /etc/profile
. ~/.bash_profile
# 定时任务执行
# 检查保险服务，如果挂了就重启
if test $( /usr/local/java8/bin/jps | grep Bootstrap | wc -l ) -eq 0
then
        /usr/local/tomcat8/bin/baoxian_restart.sh &&
        echo "保险服务挂了，执行启动 `date +'%Y-%m-%d %T'`" >> /var/log/cron_baoxian_stoped.log
fi