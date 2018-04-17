# nodejs 开发环境
## 安装 代理软件 ul / shadowsocks-go
  https://github.com/shadowsocks/shadowsocks-go
## 安装 proxychains 并配置终端代理
  https://github.com/haad/proxychains
## 安装 chrome 浏览器及代理插件SwitchyOmega
## 安装 nvm
### 使用nvm安装 node
## 安装 mysql
### 使用yum 安装 mysql （ MySQL Community Server ）
  * 下载mysql源的rpm包 （mysql57-community-release-el7-11.noarch.rpm)
  * 使用安装mysql源
  * 使用yum 安装mysql
  ```bash
    yum install mysql-server
  ```
  (参考：https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/)
  * 开启mysqld服务
  * 查看默认的root密码
   sudo grep 'temporary password' /var/log/mysqld.log
   * 对mysql执行安装配置
   ```bash
    mysql_secure_installation
   ```

## 安装 redis
  * 编译安装
  * 配置 systemctl 管理

## 安装 mongoDB
  * yum 安装
## 设置 mysql、redis、mongoDB 服务开机自启动