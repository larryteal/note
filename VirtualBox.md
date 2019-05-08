# VirtualBox
## Centos 7
  * 虚拟机无法连接外网
    * 启动网络
    ```
    ip add # 查看网卡名称
    ifup eth0 # 启用网卡
    vi /etc/sysconfig/network-scripts/eth0  # 设置网卡开机启动
    ```
  * 设置阿里云的yum源
    * https://mirrors.aliyun.com/
  * 更新系统
    ```
    yum update
    ```
  * 修改主机名
  ```
  hostnamectl set-hostname <NAME>
  ```    