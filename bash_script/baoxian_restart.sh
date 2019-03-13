#!/bin/bash
/usr/local/java8/bin/jps | grep Bootstrap | awk '{print "kill -9 " $1}' | sh && # 关闭
/usr/local/tomcat8/bin/startup.sh # 启动