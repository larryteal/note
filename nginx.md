# nginx 
## nginx 安装 （Centos 7）
  * 如果yum 源中已经存在nginx 可以直接使用yum安装
  ```bash
    sudo yum install nginx
  ```
  * 如果没有或者要安装最新版本可以设置yum源
  ```bash
    sudo /etc/yum.repos.d/nginx.repo
  ```
  * 内容如下
  ```text
  [nginx]
  name=nginx repo
  baseurl=http://nginx.org/packages/OS/OSRELEASE/$basearch/
  gpgcheck=0
  enabled=1
  ```
  * 其中 OS 字段替换成 具体的操作系统 ‘rhel’ 或者 ‘centos’ ,OSRELEASE 替换成 操作系统的版本 ‘6’ 或 ‘7’
## nginx 简介
  * nginx 有一个主进程，和一些工作进程，主进程主要负责配置文件审查以及管理工作进程，工作进程才是真正处理请求的。
  * nginx 使用基于事件系统依赖的模式来分配请求到工作进程
  * 工作进程数量可以在配置文件中定义和修改，或者根据CPU的核心数自动调整
  * 配置文件的名称是nginx.conf 位置在 /usr/local/nginx/conf, /etc/nginx, or /usr/local/etc/nginx
##   nginx 启动、停止、重新加载配置文件、重新打开 日志文件
### nginx 启动，直接运行 nginx 可执行文件
  ```bash
  sudo nginx
  ```
### nginx 停止
  * 快速关闭
  ```bash
  sudo nginx -s stop
  ```
  * 优雅的停止
  ```bash
  sudo nginx -s quit
  ```
  * 优雅的停止是等工作进程处理完当前的请求然后在退出。
### nginx 重新加载配置文件
  ```bash
  sudo nginx -s reload  
  ```
  * 修改了配置文件，只有重起或者重新加载配置文件，才能生效。
### nginx 重新打开日志文件
  ```bash
  sudo nginx -s reopen
  ```
### 向nginx进程发送信号也可以使用 Unix 工具，例如 kill ，这种方式是把信号直接传递给指定进程ID的进程
  * nginx的进程ID默认在nginx.pid 文件中，位置在/usr/local/nginx/logs 或者 /var/run 文件夹中。
  * 也可以使用下面的命令查看所有的nginx进程
  ```bash
  ps -ax | grep nginx
  ```
  ```bash
  ps axw -o pid,ppid,user,%cpu,vsz,wchan,command | egrep '(nginx|PID)'
  ```
## nginx 配置文件( nginx.conf )中的 指令
  * 简单指令（只有一行的指令）要以分号（;）结尾。
  ```text
    user             nobody;
    error_log        logs/error.log notice;
    worker_processes 1;
  ```
  * 一个指令及其使用{}包裹的相关指令形成的一个组，被称为 块。
  ```text
    http {
      server {
          location /one {
          }
          location /two {
          }
      } 
    }
  ```
### 拆分功能模块配置 在nginx.conf中使用 include 指令引入功能模块配置
  * 拆分的目的是便于管理
  * 功能配置模块文件一般放置在 conf.d 目录里。
  ```text
    include /etc/nginx/conf.d/*.conf;
  ```
### 上下文  
  * 一些顶级指令（not only）被称为上下文，他们是一组应用于不同流量类型的指令组。
  ```text
  events – General connection processing
  http – HTTP traffic
  mail – Mail traffic
  stream – TCP and UDP traffic
  ```
  * 在上面这些上下文之外的指令 被成为主上下文
  * 上下文有父子关系，子上下文继承父上下文的指令设置