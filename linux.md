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

## 小知识
  * tty 代表电传打字机(teletypewriter)。这是一个古老的名词,指的是一台用于发送消息的机器。  
  * readlink –f  /usr/bin/vi ，它能够立刻找出链接文件的最后一环
