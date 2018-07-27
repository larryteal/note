# linux （Centos 7）

## 软链接
  * 软链接相当于快捷方式
  * 目录软链接
  * 文件软链接
  * 目录软链接和文件软链接创建和删除方法一样
  * 创建：  ln   -s   源文件or目录   软链接
  * 删除：  rm   -f   软链接
  * 修改：  ln -snf  源文件 软链接
## 硬链接
  * 硬链接可以防止文件误删除
  * 有些快照就是创建硬链接
  * 当还有硬链接存在时删除源文件或硬链接文件并不会真的删除文件资源。
  * 只有当文件没有硬链接时删除才会真正的删除资源
  * 文件夹创建硬链接与文件创建硬链接命令  不同 （ln --help）
  * 创建 ln 源文件  硬链接
  * 删除 rm -f 硬链接
  
## 解压 ***.tar.xz
  ```bash
  tar -xvJf ***.tar.xz
  ```
  * or ( 也可以不加v参数 )
  ```bash
  tar -xvf ***.tar.xz
  ```
## 使用阿里云的 yum 源  
  * 参考帮助 https://opsx.alibaba.com/mirror
  * 1、备份
  ```bash
  sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
  ```
  * 2、下载新的CentOS-Base.repo 到/etc/yum.repos.d/
  ```bash
  sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
  ```
  或者
  ```bash
  sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
  ```
  * 3、之后运行yum makecache生成缓存 （可选）
## 安装源  epel-release
  * 补充资源 （例如 fuse-sshfs 包 CentOS-Base.repo 源中不存在 ）
  ```bash
  sudo yum install -y epel-release
  ```
## 环境变量
  * 打印环境变量
  ```bash
  echo $PATH  
  ```
  * 列出当前所有的环境变量
  ```bash
  env
  ```
  * 列出本地定义的所有环境变量
  ```bash
  set
  ```
  * 设置环境变量( 注意变量名与=与变量的值中间不能有空格 )
  ```bash
  NODE_ENV=100
  ```
  * 使用 export 设置环境变量 ( 使用 export 导出的变量即会显示在 env 列表中也会显示在 set 列表中，不使用export设置的环境变量只会显示在set列表中  )
  ```bash
  export NODE_ENV='hello'
  ```
  * 删除环境变量
  ```bash
  unset NODE_ENV
  ```
## 修改主机名 hostname
  * 查看当前主机名
  ```bash
  hostname
  ```
  * 修改主机名(修改后重开shell才显示新的主机名)
  ```bash
  hostnamectl set-hostname new_hostname
  ```
## 防火墙管理 
### 端口号管理
#### firewall-cmd 
  * 查看活动的 zone (作用域),一般默认是public
    * firewall-cmd --get-active-zones
  * 查看防火墙规则
    * firewall-cmd --list-all
  * 查看开启的端口号
    * firewall-cmd --list-ports
    * firewall-cmd --zone=public --list-ports  
  * 开启指定端口号
    * firewall-cmd --zone=public --add-port=80/tcp --permanent
      * zone=作用域
      * --add-port=端口号/协议
      * --permanent #永久生效，没有此参数重启后失效
  * 删除(关闭)指定端口号
    * firewall-cmd --zone= public --remove-port=80/tcp --permanent 
  * 重新载入配置
    * firewall-cmd --reload
  * 防火墙服务可以使用systemctl工具管理
    * 停止防火墙服务
      * systemctl stop firewalld
    * 禁止firewall开机启动   
      * systemctl disable firewalld   
#### iptables
  * 开启22号端口
  ```bash
  iptables -A INPUT -p tcp --dport 22 -j ACCEPT
  iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
  iptables -L -n # 查看信息

  ```
  * -A 参数就看成是添加一条 INPUT 的规则 
  * -p 指定是什么协议 我们常用的tcp 协议，当然也有udp 例如53端口的DNS 
  * –dport 就是目标端口 当数据从外部进入服务器为目标端口 
  * –sport 数据从服务器出去 则为数据源端口使用 
  * -j 就是指定是 ACCEPT 接收 或者 DROP 不接收
##### Ubuntu下保存iptables规则并开机自动加载的方法
  * 机器重启后，iptables中的配置信息会被清空。您可以将这些配置保存下来，让iptables在启动时自动加载，省得每次都得重新输入。iptables-save和iptables-restore 是用来保存和恢复设置的。
  * iptables-save > /etc/iptables.up.rules  # 先将防火墙规则保存到/etc/iptables.up.rules文件中, 需要sudo su - root切换用户后执行，直接sudo cmd是不行的
  * 然后修改脚本/etc/network/interfaces，使系统能自动应用这些规则
  ```text
  auto eth0 
  iface eth0 inet dhcp 
  pre-up iptables-restore < /etc/iptables.up.rules  # 就是加这句 !!
  ````
  


## 网络及进程状态
  * ps


## job & fg
  * Ctrl + z 挂起
  * jobs 查看挂起的任务
  * fg 序号 恢复任务
  * 在使用 ssh 时可以使用转义符 ～ Ctrl + z (  先输入 ～ 然后按 Ctrl + z 组合键 ) 挂起当前ssh 连接

##  安装网络工具 net-tools
  * 工具中包括 ifconfig、netstat 等
  * ifconfig
  * netstat

## 命令历史
  * 输入 history 命令，可以查看历史命令，历史命令存储在一个 ~/.bash_history文件中
  * 只有正常退出当前shell后用户再当前shell中执行的命令才会写入到~/.bash_history文件中（这也是history命令和~/.bash_history文件有时不一致的原因）
  * !! 执行上一条命令
  * !n 执行第n条命令
## 别名 alias
  * 使用alias为一个很长的命令起一个短的别名
  ```bash
  alias la='ls -al'
  ```
  * alias别名设置是临时的，退出shell后别名失效
  * 可以别名设置写到 ～/.bashrc  或 ～/.bash_profile 文件中 (source)

## shell 与 子 shell
  * 在无图形界面的系统中，我们登陆主机后就已经处于一个shell中了，这个shell就是将来要执行的脚本的父shell。
  * 再有图形界面的窗口，开启一个 terminal 就是开启了一个shell，他是在其中执行脚本的父shell。
  * 当执行一个脚本时，父shell会根据脚本程序的的第一行#! 之后指定的shell程序来开启一个子shell环境，然后在子shell中执行这个脚本程序，执行完毕子shell结束，回到父shell，不影响父shell的环境。
  * 执行脚本的方式有三种
    * 1、source filename 或者  .    filename 
    * 2、sh filename 或者 bash filename
    * 3、./filename
  * 三种执行方式的差别：
      * 用 sh filename 、bash filename、./filename 的方式执行脚本时会新建一个子shell，在子shell中执行脚本内容。在子shell中新建或修改的变量不会被带回父shell中。
      * 用 source filename 、 .    filename 的方式执行脚本时不会新开子shell，而是先读取脚本内容然后在当前shell中执行

## 切换到不同的终端 Ctrl+Alt+F1~F7
  * Ctrl+Alt+F1 是图形界面（Centos 7）
  * Ctrl+Alt+F2~F6 是Shell 终端
  * Ctrl+Alt+F7 （没有成功启动终端）

## which 和 type （ 可选 -a 参数，显示更多信息 ）
  * which 显示命令位置
  ```bash
  which ps
  which pwd
  which -a pwd
  ```    
  * type 显示命令位置以及shell内建命令信息
  ```bash
  type -a pwd
  ```
## mv 移动多个文件或目录
  * 使用 -t 指定目标目录
  * mv  dir1  dir2  dir3  -t  dest_dir
## alternatives 软件多版本管理
### java 版本控制
  * 下载安装JDK （rpm包）
  * sudo alternatives --config java  ( 列出选项 )
  * java -version 
## 使用代理
### 控制台使用代理
  * 安装 proxychains4 (github,https://github.com/rofl0r/proxychains-ng)
  * 启动代理软件
  * 默认配置文件为 /etc/proxychains.conf
    ```text
    # 主要配置项
    socks5	127.0.0.1     1080
    ```
  * proxychains4 npm install express --save
### 浏览器根据规则列表自动选择代理或直连
  * 前提,安装浏览器代理插件,SwitchyOmega
  * 新建一个代理,情景模式的类型选择 '代理服务器',并设置好
  * 再新建一个代理,情景模式的类型选择 '自动切换模式'
    * 规则列表设置为 'AutoProxy',
    * 填入规则列表网址,(github,https://github.com/larryteal/gfwlist)
    * 点击立即更新情景模式
    * 切换规则中的,规则列表 设置为上一步设置的代理
    * 切换规则中的,	默认情景模式 设置为直连
  * <img src="images/2018-07-26 14-21-46 的屏幕截图.png">

### wujie 代理设置
  * 查看帮助
    ```bash
    ./ul --help
    ```
    ```text
      Usage of ./ul:
        -L string
            listen address (default "127.0.0.1:9666")
        -P string
            http or sock proxy, example: 1.2.3.4:8080 or http://1.2.3.4:8080 or socks://1.2.4.4:1080 or socks5://1.2.3.4:1080 or socks=1.2.3.4:1080
    ```
  * 默认监听 127.0.0.1:9666
  * 指定绑定的地址
    ```bash
    ./ul -L '192.168.16.158:9666'
    ```
  * -P 参数可以指定协议,http or sock
      
## 创建快捷方式
  *  在目录 /usr/share/applications 下创建 xxxx.desktop 文件
  * eg:  Android  Studio  
    *  先键文件 /usr/share/applications/android-studio.desktop
    * 内容为(根据软件实际安装位置配置)
    ```text
    [Desktop Entry]
    Encoding=UTF-8
    Name=AndroidStudio
    Exec=/home/Larry/software/android-studio/bin/studio.sh
    Icon=/home/Larry/software/android-studio/bin/studio.png
    Categories=Utility;Development;
    Version=3.1.3
    Type=Application
    Terminal=0
    ```
## 挂载移动硬盘 （ntfs 文件格式）
  * 安装 ntfs-3g 模块
  * 安装后就可以在文件系统中访问了(自动挂载)
  * 也可手动挂载
  * 相关命令
    ```bash
      yum list *ntfs*
      yum install ntfs-3g
      mount -t ntfs-3g /dev/sdb1 /mnt/udisk
    ```  


## 查找
### 文件查找
  ```bash
  find ./ -name file.name
  ```
### 在文件中搜索字符串,grep
  * grep 的语法支持正则表达式
  ```bash
  grep  -nr   'target_string'  * # * 就是一般的bash通配符，表示当前目录所有文件，当然，你也可以写某个文件名
  ```
  * -n ,显示行号
  * -r, 递归子目录
  * -A num, --after-context=num: 在结果中同时输出匹配行之后的num行
  * -B num, --before-context=num: 在结果中同时输出匹配行之前的num行，有时候我们需要显示几行上下文。
  * -i, --ignore-case: 忽略大小写
  * -v, --invert-match: 输出没有匹配的行
  * l ,只列出匹配的文件名
  * L,只列出不匹配的文件名
  * -w 只匹配整个单词，而不是字符串的一部分
  
### 字符串替换
  * sed -i "s/old/new/g" file1.txt file2.txt 可以将file*.txt中的所有old换成new。如果new什么都没有，就是表示删除old的意思。
  * sed -i "s/http:\/\/yyy.xxx.edu.cn//g" $(grep -lr "http://yyy.xxx.edu.cn" *)  查找替换组合命令,把网址替换成了 /



## 小知识
  * tty 代表电传打字机(teletypewriter)。这是一个古老的名词,指的是一台用于发送消息的机器。  
  * readlink –f  /usr/bin/vi ，它能够立刻找出链接文件的最后一环
  * 查看ip地址
    ```bash
    ifconfig
    ifconfig -a
    ip  addr
    ```
  * 查看内存使用情况
    ```bash
    free -h
    ```
    * 参考 http://www.cnblogs.com/ggjucheng/archive/2013/01/14/2859613.html
  * 查看cpu信息
    ```bash
    lscpu
    ```    
