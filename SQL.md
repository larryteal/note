# PostgreSQL

## 命令
 - psql -U postgres -W 连接数据库
 - \h 帮助
 - \? 命令帮助
 - \h create database 命令帮助
 - \l 列出数据库
 - create database encoding utf8; 创建数据库
  ```
  如果不存在 创建数据库
  SELECT 'CREATE DATABASE mydb'
  WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'mydb')\gexec
  ```
 - drop database if exists [db-name]; 删除数据库
 - \c [db-name] 切换数据库
 - \d 显示表
 - \d [table-bame] 显示表结构
 - \du 列出所有用户
 - create table [table-name]([字段名] [字段数据类型] [约束],....);  

