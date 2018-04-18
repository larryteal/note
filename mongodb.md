# mongoDB 使用 v3.6.4

## 添加管理员
```mongo
  use admin
  db.createUser({
    user:'user name',
    pwd:'password',
    roles:[{ role:'权限',db:'admin' }]
  })
```
* 先添加管理员。然后再添加其他库的用户。
```mongo
  use testDB
  db.createUser({
    user:'user name',
    pwd:'password',
    roles:[{ role:'权限',db:'testDB' }]
  })
```
## 配置mongoDB认证
* 修改/etc/mongod.conf,设置security.authorization 为 enabled
```bash
# security
security:
  authorization: enabled
```
* 不同版本的mongoDB 设置可能会有不同。
* 注意格式，authorization: 后面有一个空格，没有空格会出错无法启动！！
## 修改mongoDB的数据存储位置方法
* 修改配置文件/etc/mongo.conf
```bash
storage:
  dbPath: /data/mongo
```  
* 关闭mongod服务
```bash
sudo systemctl stop mongod
```
* 把mongodb原来的旧数据复制到新文件夹里
```bash
sudo cp -ra /var/lib/mongo   /data/mongo
```

