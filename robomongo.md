# Centos 7 安装 Robomongo， MongoDB的可视化工具
## 当前（2018.4.23）最新 Robo 3T 1.2 
  centos 7 安装尝试失败，却少GLIBC_2.18,安装后可以启动，需要填写邮箱帐号等，跳过后报错 `段错误(吐核)`，之后再启动直接报`段错误(吐核)`，不纠结，急着用遂找低版本尝试。
## 下载安装robomongo 0.9.0
* 在 github release   中找到0.9.0版本
* 使用管理员权限解压到 /opt 目录，（尝试普通解压，没有使用 -C 参数，没有使用root权限时发现robomongo/bin目录下没有可执行文件robomongo,使用下面的命令正常，并且可以正常使用，此时环境中已经在上一次的尝试中安装了GLIBC 2.18，不知道没有安装的情况）
```bash
sudo tar -zxvf robomongo-0.9.0-linux-x86_64-0786489.tar.gz -C /opt
```
* 创建可执行文件robomongo的链接，方便命令行启动使用
```bash
sudo ln -s /opt/robomongo-0.9.0-linux-x86_64-0786489/bin/robomongo /bin/robomongo
```
* 创建快捷方式
在/usr/share/applications/文件夹下，用vim新建一个 robomongo.desktop 的文件 
sudo vim robomongo.desktop 
```vim
  [Desktop Entry]
  Encoding=UTF-8
  Name=Robomongo
  Exec=/opt/robomongo-0.9.0-linux-x86_64-0786489/bin/robomongo
  Icon=/opt/robomongo-0.9.0-linux-x86_64-0786489/robo.png
  Categories=Development;
  Version=0.9.0
  Type=Application
  Terminal=0
```
