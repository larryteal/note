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
# 添加新用户
  ```
  mysql> CREATE USER 'finley'@'localhost' IDENTIFIED BY 'password';
  mysql> GRANT ALL PRIVILEGES ON *.* TO 'finley'@'localhost'
      ->     WITH GRANT OPTION;
  mysql> CREATE USER 'finley'@'%' IDENTIFIED BY 'password';
  mysql> GRANT ALL PRIVILEGES ON *.* TO 'finley'@'%'
      ->     WITH GRANT OPTION;
  mysql> CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
  mysql> GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';
  mysql> CREATE USER 'dummy'@'localhost';
  ```  
# 数据导入导出
  ```
  mysqldump --host rm-bp1q8ebcv890a2n20wo.mysql.rds.aliyuncs.com -u sulaibao_pay -p  --set-gtid-purged=OFF sulaibao_pay > sulaibao_pay.sql
  mysql> source ./sulaibao_pay.sql
  ```
## 设置自动增长字段值
  * 查看自动增长字段值
  ```
  select auto_increment from information_schema.tables where table_schema='db name' and table_name='table name';
  ```
  * 修改自动增长数值
  ```
  alter table `tablename` auto_increment=NUMBER;
  ```
