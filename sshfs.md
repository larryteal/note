# sshfs 

## 使用 yum 安装 sshfs
  * 安装源（如果没有安装），默认源中不存在 sshfs 的包
  ```bash
  sudo yum install -y epel-release
  ```
  * 安装 sshfs
  ```bash
  sudo yum -y install fuse-sshfs
  ```
 ## sshfs 的使用
 ### 挂载
  * sshfs 是加密的安全的（ssh）
   * 挂载语法
   ```bash
   sshfs [user@]hostname:[directory] mountpoint
   ```
   * 如果缺失用户名，则使用本地用户名
   * 如果缺失目录，则默认使用远程机器上的home目录
   * 身份认证使用的是ssh
   * e.g 
   ```bash
   sshfs Larry@192.168.122.43:/home/Larry  ./remoteDir
   ```
### 取消挂载
  * 语法
  ```bash
  fusermount -u mountpoint
  ```
  * e.g 
  ```bash
  fusermount  -u  ./remoteDir
  ```
  * 其他系统（On BSD and OS-X, to unmount the filesystem）
  ```bash
  umount mountpoint
  ```
