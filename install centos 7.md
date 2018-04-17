# U盘安装 centos 7 操作系统
## 在启动界面按 ‘e’ 编辑启动设置。
  * 默认的启动位置错误，无法正常加载。
  * 修改 hd: 后面的内容为 hd:/dev/sdb4
  如果不知道具体的U盘设备名称，可以在启动时先不编辑启动设置，等其打印错误结束后会出现终端操作界面，可以使用下面的命令查看
  ```bash
  ls /dev
  ```
## 系统安装结束后，首先要做的就是要更新系统，但是在此之前最好先修改yum源为国内镜像，例如阿里云的centos镜像
  * 访问网址：https://opsx.alibaba.com/mirror
  * 在centos 项中查看帮助进行设置
  1、备份
  ```bash
  mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
  ```
  2、下载新的CentOS-Base.repo 到/etc/yum.repos.d/  
  ```bash
  wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
  ```
  或者
  ```bash
  curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
  ```
  3、之后运行yum makecache生成缓存
  * yum 相关命令
  ```bash
  yum clean all
  yum makecache
  yum update -y
  ```
## 添加拼音输入法
  系统工具---》设置  ----》区域和语言 ----》输入源 ----》 点加号找到Pinyin添加
##  设置自动网络连接
  有线设置 ----》 有线连接 ----》点击齿轮按钮 ----》 身份 -----》勾选自动连接 ----》 应用

## 添加打开终端的快捷键
  系统工具---》设置 ----》键盘 ----》自定义快捷键点加号添加 ----》命令是 gnome-terminal （其他自定义）
