# Kong 网关
## 安装Kong 下载二进制rpm包，yum安装。
## 安装Kong的存储依赖，cassandra数据库。
  * 通过yum安装
  * 创建文件 /etc/yum.repos.d/cassandra.repo，内容如下：
  ```text
  [cassandra]
  name=Apache Cassandra
  baseurl=https://www.apache.org/dist/cassandra/redhat/311x/
  gpgcheck=1
  repo_gpgcheck=1
  gpgkey=https://www.apache.org/dist/cassandra/KEYS
  ```
  * The latest <release series> is 311x （2018.05.25）
  * For older releases, the <release series> can be one of 30x, 22x, or 21x
  * 配置好后执行安装
  ```bash
  sudo yum install cassandra
  ```
  * 启动Cassandra
  ```bash
  service cassandra start
  ```
  * 第一次启动好像

## Kong 配置文件
  * 默认 /etc/kong/kong.conf.default，可以复制此文件
  ```bash
  cp /etc/kong/kong.conf.default /etc/kong/kong.conf
  ```
  * kong 启动时默认加载/etc/kong/kong.conf 或者 /etc/kong.conf，也可以使用 -c 或 --conf 参数指定配置文件路径
  ```bash
  kong start --conf /path/to/kong.conf
  ```
  * kong 默认存储使用的是 postgres,如果使用cassandra可以下该kong.conf 文件，
  ```text
  database = cassandra
  ```
  * 使用普通用户启动 kong 时 会提示 /usr/local/kong 目录不存在，然后自动创建权限不够，可以使用root用户手动创建此目录，然后授权其他用户可写（777），也可以使用root用户启动 kong（不知道那种更合理）。
  * 启动时有可能报 ulimit 警告，可以根据提示设置 ulimit 然后在启动。
  ```text
  [warn] ulimit is currently set to "1024". For better performance set it to at least "4096" using "ulimit -n"
  ```
  * 使用cassandra数据库时，还要配置 db_update_propagation，例如：
  ```text
  db_update_propagation = 10
  ```



