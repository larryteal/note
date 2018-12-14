# MySql

## yum 安装 mysql
  * 参考官网
  * 安装mysql 的repo仓库
    * 下载 repo 仓库rpm 文件 (mysql80-community-release-el7-{version-number}.noarch.rpm)
    * 替换 platform-and-version-specific-package-name 为下载的RPM包的名称
    ```bash
    sudo yum localinstall platform-and-version-specific-package-name.rpm
    ```
    * 安装后 在 /etc/yum.repo.d/ 目录下身成 mysql 的 repo 文件
  * 安装 mysql-community-server
  ```bash
  yum install mysql-community-server
  ```
## 修改mysql 数据库的 root 密码  
  * 启动 mysql 服务
  ```bash
  systemctl start mysqld
  ```
  * 设置 mysql 自启动
  ```bash
  systemctl enable mysqld
  ```
  * 默认密码 (启动 mysqld 服务后会生成 /var/log/mysqld.log 文件)
  ```bash
  grep 'temporary password' /var/log/mysqld.log
  ```
  * 使用默认密码登陆数据库
  ```bash
  mysql -uroot -p
  ```
  * 更改 root 密码
  ```bash
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
  ```
  
  