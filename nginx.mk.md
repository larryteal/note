# nginx 学习
## 准备
## 安装软件
    * yum -y install gcc gcc-c++ autoconf pcre pcre-devel make automake
    * yum install -y wget httpd-tools vim
### 创建目录
   ```bash
   sudo cd /opt;mkdir app logs downloads works backup
   ``` 
### 关闭iptables 规则
    * 查看规则
    ```bash
    sudo iptables -L
    sudo iptables -t nat -L
    ```        
    * 关闭规则
    ```bash
    sudo iptables -F
    sudo iptabels -t nat -F
    ```
### 关闭SELinux
    * 查看
    ```bash
    sudo getenforce
    ```
    * 关闭
    ```bash
    sudo setenforce 0
    ```
### 安装 nginx 
    * 参考 http://nginx.org
    ```bash
    sudo vim /etc/yum.repos.d/nginx.repo
    [nginx]
    name=nginx repo
    baseurl=http://nginx.org/package/OS/OSRELEASE/$basearch/
    gpgcheck=0
    enabled=1
    ```
    * OS 替换成具体的操作系统如 centos/rhel，OSRELEASE 替换为系统的版本，6.x 写 6，7.x 的写 7
#### nginx 信息查看
    * 查看版本
    ```bash
    nginx -v
    ```
    * 查看安装详细信息
    ```bash
    nginx -V
    ```
    * 查看nginx服务状态
    ```bash
    sudo systemctl status nginx
    ```
### 查看nginx 安装信息（安装目录/创建的文件）        
    ```bash
    rpm -ql nginx
## nginx 配置    
### nginx 默认配置
    * 配置文件路径 /etc/nginx/nginx.conf
    * user 设置nginx的启动用户（身份，一般保持默认的nginx）
    * worker_processes 工作进程数（跟cpu个数保持一致）
    * events worker_connections 每个进程允许的最大连接数（最大 65535）
            use  设置nginx使用的内核模型（select poll epoll）
