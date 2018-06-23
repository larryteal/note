#
## Linux系统将硬件设备当成特殊的文件,称为设备文件。设备文件有3种分类:
  * 字符型设备文件
  * 块设备文件
  * 网络设备文件
  * 字符型设备文件是指处理数据时每次只能处理一个字符的设备。大多数类型的调制解调器和终端都是作为字符型设备文件创建的。
  * 块设备文件是指处理数据时每次能处理大块数据的设备,比如硬盘。
  * 网络设备文件是指采用数据包发送和接收数据的设备,包括各种网卡和一个特殊的回环设备。这个回环设备允许Linux系统使用常见的网络编程协议同自身通信。
  * Linux为系统上的每个设备都创建一种称为节点的特殊文件。与设备的所有通信都通过设备节点完成。每个节点都有唯一的数值对供Linux内核标识它。数值对包括一个主设备号和一个次设备号。类似的设备被划分到同样的主设备号下。次设备号用于标识主设备组下的某个特定设备。
## 几种shell
  * bash shell ， linux 默认shell
  * ash ，一种运行在内存受限环境中简单的轻量级shell，但与bash shell 完全兼容。
  * korn ，一种与Bourne shell 兼容的编程shell，但支持如关联数组和浮点运算等一些高级的编程特性
  * tcsh  , 一种将C语言中的一些元素引入到shell脚本中的shell。
  * zsh ， 一种结合了bash、tcsh、korn的特性，同时提供高级编程特性、共享历史文件和主题化提示符的高级shell  。
## GNOME Terminal ( Centos 7 GNOME桌面 ),几个快捷键
  * 开启新终端：
    * 快捷键 Ctrl+Alt+t，如果没有可以新增自定义快捷键，命令是gnome-terminal
    * 在shell终端中输入shell命令 gnome-terminal
    * （Open Terminal） 在开启的gnome terminal 终端中再开启一个新启一个shell会话快捷键 Shift+Ctrl+n（与Ctrl+Alt+t不同的是Shift+Ctrl+n 要在活动的gnome terminal 终端中按下才有效）
    * （ Open Tab ）在同一个窗口中开启另一个shell会话 Shift+Ctrl+t
  * 关闭终端
    * Close Tab , Shift+Ctrl+w
    * Close Window, Shift+Ctrl+q  
  * 终端中的复制粘贴
    * Cpoy ， Shift+Ctrl+c  复制
    * Paste ， Shift+Ctrl+v  粘贴
  * 终端的全屏与恢复
    * Full Screen ，F11
  * 终端字体缩放
    * Ctrl++ ,逐步放大字体（我的是Ctrl+Shift++）
    * Ctrl-- ，逐步缩小字体
    * Ctrl+0 ，恢复默认设置  
  * 切换 Tab
    * 下一个 Tab ，Ctrl+PageDown
    * 上一个 Tab ，Ctrl+PageUp
    * 将当前标签向前移动一次 Ctrl+Shift+PageUp
    * 将当前标签向后移动一次 Ctrl+Shift+PageDown
## linux 常见目录及用途
  * / 虚拟目录的根目录。通常不会在这里存储文件
  * /bin 二进制目录,存放许多用户级的GNU工具
  * /boot 启动目录,存放启动文件
  * /dev 设备目录,Linux在这里创建设备节点
  * /etc 系统配置文件目录
  * /home 主目录,Linux在这里创建用户目录
  * /lib 库目录,存放系统和应用程序的库文件
  * /media 媒体目录,可移动媒体设备的常用挂载点
  * /mnt 挂载目录,另一个可移动媒体设备的常用挂载点
  * /opt 可选目录,常用于存放第三方软件包和数据文件
  * /proc 进程目录,存放现有硬件及当前进程的相关信息
  * /root root用户的主目录
  * /sbin 系统二进制目录,存放许多GNU管理员级工具
  * /run 运行目录,存放系统运作时的运行时数据
  * /srv 服务目录,存放本地服务的相关文件
  * /sys 系统目录,存放系统硬件信息的相关文件
  * /tmp 临时目录,可以在该目录中创建和删除临时工作文件
  * /usr 用户二进制目录,大量用户级的GNU工具和数据文件都存储在这里
  * /var 可变目录,用以存放经常变化的文件,比如日志文件
## 几个 Linux  命令
  * cd 切换目录 （～ 表示用户家目录）
  * pwd 显示当前目录
  * ls 显示目录列表
    * ls -F （ -F  参数可以方便的区分目录和文件，特别是没有色彩标示的终端，目录后面会显示 / ，文件则不会显示 / ）
    * ls -a ,（-a 显示隐藏文件）
    * ls -R ,( -R 第归显示当前目录及子目录文件 )
    * ls -l ，（ -l 显示详细信息），详细信息一次为
      * 文件类型
        * d 目录
        * - 文件
        * c 字符文件
        * b 块设备
      * 文件权限（所有者，组，其他）
        * r 读 
        * w 写
        * x 执行  
      * 硬链接数
      * 文件所有者名称
      * 文件所属组的名称
      * 文件大小（单位字节）  
      * 文件上次修改时间
      * 文件或目录名称
    * ls *.js 使用通配符过滤显示
      * （*） 代表0个或多个字符
      * （？）代表1个字符
      * （[a-c]）（[abcd]）（[!abc]） 指定范围
  * touch  test.txt  创建空文件
    * touch 命令还可以更改文件的修改时间，而其他不变（touch  已经存在的文件）
  * cp 文件复制 （ cp source dest）
    * -i ,如果目标文件已经存在 -i 参数会强制提示是否覆盖（使用y和n来回答）
  * ln 创建链接
    * ln -s 创建软链接
    * ln     创建硬链接
    * 每个文件或目录都有一个inode数字编号，用于唯一标示文件或目录，可以 ls -i  显示 inode 编号。通过观察inode可以发现软链接文件的inode编号与源文件不同，而且软链接文件大小较小；硬链接文件inode数字编号与源文件一样而且文件大小一样，这是因为硬链接文件与全文件共享inode编号是同一个文件。
  * mv  移动文件、目录位置，或文件、目录重命名  
    * mv -i ，存在同名文件、目录时强制提示是否覆盖
  * rm 删除文件、目录
    * -r 删除目录
    * -i 强制提示是否真的删除 
    * -f 不询问直接删除
    * rm -ir 删除目录 一级一级的询问删除
  * rmdir  删除空目录（只能删除空目录，没有-i参数）
  * mkdir 创建目录
    * -p 一次性创建目录及子目录  
      ```bash
      mkdir aa/bb/cc
      ```
  * tree 树形结构显示目录及子目录、文件
    * 默认没有这个工具可以通过 yum 安装
      ```bash
      sudo yum install tree
      ```      
  * file 查看文件类型
    ```bash
    file test.txt
    ```
    *  ASCII text ，文本文件
    *  directory ，文件夹
    * ....
  * cat 、more 、less 、tail、head 查看文本文件      
    * cat test.txt  ( 显示文件 )
    * cat -n test.txt  ( -n 显示行号,所有行 )
    * cat -b test.txt  ( -b 显示行号,只给有文本的行加上行号 )

    * more test.txt  分页的形式显示文件，使用空格键翻页，q键退出

    * less test.txt ,less 是more 的增强版，支持查找等功能

    * tail 显示末尾几行，默认显示10行，可以使用 -n 参数指定显示的行数
      ```bash
      tail test.txt -n 5
      ```
      * -f 参数是 tail 命令的一个突出特性。它允许你在其他进程使用该文件时查看文件的内容。tail 命令会保持活动状态,并不断显示添加到文件中的内容。这是实时监测系统日志的绝妙方式。
    * head 显示开头几行，与tail相反 ,不支持 -f 这样的参数，可以使用 -6 或 -n 6 这样的方式指定显示的行数
      ```bash
      head -6 test.txt
      ``` 
      ```bash
      head -n 6 test.txt
      ``` 
  * ps 结果字段显示说明 （Unix 风格 ps -ef） ：
    * UID:启动这些进程的用户。
    * PID:进程的进程ID。
    * PPID:父进程的进程号(如果该进程是由另一个进程启动的)
    * C:进程生命周期中的CPU利用率。
    * STIME:进程启动时的系统 时间。
    * TTY:进程启动时的终端设备。
    * TIME:运行进程需要的累计CPU时间。
    * CMD:启动的程序名称。
    * F :内核分配给进程的系统标记。
    * S :进程的状态(O代表正在运行;S代表在休眠;R代表可运行,正等待运行;Z代表僵化,进程已结束但父进程已不存在;T代表停止。
    * PRI :进程的优先级(越大的数字代表越低的优先级)
    * NI :谦让度值用来参与决定优先级。
    * ADDR :进程的内存地址。
    * SZ :假如进程被换出,所需交换空间的大致大小。
    * WCHAN :进程休眠的内核函数的地址。
  * top  实时监测进程
    * 输出的第一部分显示的是系统的概况:第一行显示了当前时间、系统的运行时间、登录的用户数以及系统的平均负载。平均负载有3个值:最近1分钟的、最近5分钟的和最近15分钟的平均负载。值越大说明系统的负载越高。由于进程短期的突发性活动,出现最近1分钟的高负载值也很常见,但如果近15分钟内的平均负载都很高,就说明系统可能有问题。
    * 第二行显示了进程概要信息—— top 命令的输出中将进程叫作任务(task):有多少进程处在运行、休眠、停止或是僵化状态(僵化状态是指进程完成了,但父进程没有响应)。
    * 下一行显示了CPU的概要信息。 top 根据进程的属主(用户还是系统)和进程的状态(运行、空闲还是等待)将CPU利用率分成几类输出。
    * 紧跟其后的两行说明了系统内存的状态。第一行说的是系统的物理内存:总共有多少内存,当前用了多少,还有多少空闲。后一行说的是同样的信息,不过是针对系统交换空间(如果分配了的话)的状态而言的。
    * 显示字段说明：
        * PID:进程的ID。
        * USER:进程属主的名字。
        * PR:进程的优先级。
        * NI:进程的谦让度值。
        * VIRT:进程占用的虚拟内存总量。
        * RES:进程占用的物理内存总量。
        * SHR:进程和其他进程共享的内存总量。
        * S:进程的状态(D代表可中断的休眠状态,R代表在运行状态,S代表休眠状态,T代表跟踪状态或停止状态,Z代表僵化状态)。
        * %CPU:进程使用的CPU时间比例。
        * %MEM:进程使用的内存占可用内存的比例TIME+:自进程启动到目前为止的CPU时间总量。
        * COMMAND:进程所对应的命令行名称,也就是启动的程序名。
  * kill  结束进程
    * Linux沿用了Unix 的进程间通信方法——信号通信。         * 进程的信号就是预定义好的一个消息,进程能识别它并决定忽略还是作出反应。进程如何处理信号是由开发人员通过编程来决定的。大多数编写完善的程序都能接收和处理标准Unix进程信号。
    * 进程信号：信号、名称、描述
      * 1      HUP        挂起
      * 2      INT         中断
      * 3      QUIT       结束运行
      * 9      KILL       无条件终止
      * 11    SEGV      段错误
      * 15    TERM     尽可能终止
      * 17    STOP      无条件停止运行,但不终止
      * 18    TSTP      停止或暂停,但继续在后台运行
      * 19    CONT     在 STOP 或 TSTP 之后恢复执行
    * kill 可以通过进程ID（PID） 给进程发信号，默认情况下kill命令会向命令行中列出的PID发送一个TERM信号。、
    * kill 命令只能同过PID向进程发送信号，而不能使用进程名。
    * kill 可以使用 -s 指定要发送的的信号（信号名或者信号值）或者直接使用 -信号值 的方式指定信号
      ```bash
        kill -s 1 12355
        kill -1 12355
        kill -s HUP 12355
      ```
    * 只有是进程的所有者或者是root用户时发送的信号才有效。
  * killall 可以通过指定进程名的方式向进程发送信号信号发送方式与kill一致
    ```bash
    killall -1 ./ul
    ```
    * killall 还支持通配符的方式向进程发送信号
      ```bash
      killall -s HUP http*
      ```  
## 监测磁盘空间
### 挂在存储媒体
  * Linux  文件系统将所有的磁盘都并入一个虚拟目录下。在使用新的存储媒体之前需要把它挂在到虚拟目录下。（如今大多数都能自动挂在特定类型的可移动存储媒体CD、U盘等）
#### mount 挂在命令
  * 默认情况mount 会列出当前系统的挂载设备列表。
  * mount 列出的信息包含如下四部分信息：
    * 1、媒体的设备文件名
    * 2、媒体挂载到虚拟目录的挂载点。
    * 3、文件系统类型 （ext3、vfat 。。。）
    * 4、已挂载媒体的访问状态（访问权限 r w ）
  * 要手动在虚拟目录中挂载设备，需要root用户权限。
    * 命令格式为 ： mount -t  type  device  directory
      ```bash
      mount -t vfat /dev/sdb1  /media/disk
      ```
    * type 是指文件类型：
      * vfat ：Windows 长文件系统
      * ntfs ：Windows NT XP 7 中的高级文件系统
      * iso9660 ： CD 文件系统
      * 大多数U盘是vfat文件系统。CD必须是iso9660
    * 挂载后root用户有访问权限，其他用户可能没有，需要重新分配权限。
    * 其他参数 man mount
#### unmount 移除（卸载）一个可移动设备。    
  * unmount [ directory | device ]
    ```bash
    unmount /dev/sdb1
    ```
    or
    ```bash
    unmount /media/disk
    ```
  * 注意不能在挂载的目录里面卸载设备（矛盾阿），切换到其他目录   

### 使用 df 命令 查看磁盘使用情况
  * df -h (使用 -h 参数打印用户可读的数据信息，例如使用 G 作为单位 ) 

### 使用 du 命令查看具体目录或文件的的磁盘使用情况
  * du [ file | directory ]  [options]
  * 默认是当前目录下的所有的文件、目录、子目录的磁盘使用情况。
  * 使用 du 最好加写参数
    * -c ： 显示已列出文件的总大小
    * -h ： 使用易读的方式显示，即 K、M、G 等为单位显示
    * -s ： 显示每个输出参数的总计。
### 处理数据文件
#### sort 排序
  * 对文件内容排序
    ```bash
    sort test.txt
    ```
  * 对输出内容排序
    ```bash
    ls | sort
    ```  
  * 使用 -n 参数，把数字当成数字而不是字符来排序。
  * -M 按月排序 ，（有时候日志文件需要）
  * -r 反序
#### grep 搜索数据
  * 在文件中查找数据
  * grep [oprions] pattern [file]
    ```bash
    grep 11  test.txt
    ```
  * 参数  
    * -v  ，查找与模式不匹配的数据
    * -n ，显示行号  
    * -c ，显示匹配的行的行号
    * -e ，如果有多个匹配模式可以使用 -e 来指定（或的关系）
      * e.g : 搜索包含 1 或 2 的行
      ```bash
      grep -e 1 -e 2 test.txt
      ```
  * 默认情况下 grep 使用 Unix 风格的正则表达式作为匹配模式
    ```bash
    grep [12] test.txt
    ```
####  数据压缩    
  * bzip2  , .bz2  
  * zip     , .zip 
    * 解压 unzip
  * gzip   , .gz
    * 解压 gunzip
#### tar 归档数据（打包）
  * tar function [options] object1 object2 ...
  * tar 功能
    * -A --concatenate 将一个已有tar归档文件追加到另一个已有tar归档文件
    * -c --create 创建一个新的tar归档文件
    * -d --diff 检查归档文件和文件系统的不同之处
    * --delete 从已有tar归档文件中删除
    * -r --append 追加文件到已有tar归档文件末尾
    * -t --list 列出已有tar归档文件的内容
    * -u --update 将比tar归档文件中已有的同名文件新的文件追加到该tar归档文件中
    * -x --extract 从已有tar归档文件中提取文件
  * tar 选项
    * -C dir 切换到指定目录
    * -f file 输出结果到文件或设备 file
    * -j 将输出重定向给 bzip2 命令来压缩内容
    * -p 保留所有文件权限
    * -v 在处理文件时显示文件
    * -z 将输出重定向给 gzip 命令来压缩内容    
  * 常用组合举例
    * 创建test.tar的归档文件，包含 test和test2两个目录
      ```bash
      tar -cvf  test.tar   test/  test2/
      ```
    * 列出归档内容,但并不提取出来
      ```bash
      tar -tf test.tar
      ```
    * 提取归档内容
      ```bash
      tar -xvf test.tar
      ```  
    * 归档并gzip压缩
      ```bash
      tar -czvf test.tar.gz   test/  test2/
      ```  
    * 解压并提取.tar.gz
      ```bash
      tar -xzvf test.tar.gz
      ```
## shell 的父子关系
  * 用于登录某个虚拟控制器终端或在GUI中运行终端仿真器时所启动的默认的交互shell,是一个父shell。
  * 在父shell中输入 bash 或 sh 命令会新建一个新的shell叫做子shell。
  * 在子shell中输入exit命令退出子shell返回到父shell
  * 通过 ps -f 命令可以查看父子shell的关系
  * bash shell是一个程序,当它运行的时候,就成为了一个进程。一个运行着的shell就是某种进程而已
  * ps --forest 命令展示了这些子shell间的嵌套结构
  * bash 的一些启动参数
    * -c string 从 string 中读取命令并进行处理
    * -i 启动一个能够接收用户输入的交互shell
    * -l 以登录shell的形式启动
    * -r 启动一个受限shell,用户会被限制在默认目录中
    * -s 从标准输入中读取命令
### 在一行中执行多个命令（命令列表）
  * 多个命令之间用 分号（；）隔开即可
    ```bahs
    pwd ; ls ; cd ; pwd ; ls ;echo $BASH_SUBSHELL
    ```  
### 进程列表  
  * 将命令列表使用括号括起来
    ```bahs
      (pwd ; ls ; cd ; pwd ; ls ; echo $BASH_SUBSHELL)
    ``` 
  * 命令使用括号括起来后会生成一个子shell 来执行   
### 后台模式 & 进程列表的后台模式
  * 在后台模式中运行命令可以在处理命令的同时让出CLI,以供他用
  * sleep 为例 ： 
      * 不使用后台模式
      ```bash
      sleep 10
      ```
      * 使用后台模式
      ```bash
      sleep 10 &
      ```
  * 将进程列表作为作为后台模式运行
    ```bash
    (sleep 100; echo $BASH_SUBSHELL;) &
    ```
    ```bash
    ( tar -cf Rich.tar /home/rich ; tar -cf My.tar /home/larry ) &
    ```
### 协程 coproc
  * 协程可以在后台生产一个子shell，并在子shell中执行命令
    ```bash
    coproc sleep 100
    ```
  * 可以使用jobs命令查看，coproc会给协程起一个默认的名字COPROC
  * 可以指定协程的名字, 注意空格和分号，名字与 { 之间要有空格，要执行的命令后面要加分号（；） ，分号与 } 之间也要有空格
    ```bash
    coproc My_job { sleep 10; }
    ```  
### 生成子shell的成本不低，而且很慢。 创建嵌套子shell更是火上浇油! 

### shell 的内建命令
  * 命令分内建命令和外部命令
#### 外部命令
  * 外部命令,有时候也被称为文件系统命令,是存在于bash shell之外的程序。它们并不是shell 程序的一部分。外部命令程序通常位于/bin、/usr/bin、/sbin或/usr/sbin中。
  * ps 就是一个外部命令。你可以使用 which 和 type 命令找到它。
  ```bash
  which ps
  ```
  ```bash
  type -a  ps
  ```
  * 当外部命令执行时,会创建出一个子进程。这种操作被称为衍生(forking)。外部命令 ps 很方便显示出它的父进程以及自己所对应的衍生子进程。
#### 内建命令
  * 内建命令和外部命令的区别在于前者不需要使用子进程来执行。它们已经和shell编译成了一体,作为shell工具的组成部分存在。不需要借助外部程序文件来运行。  
  * cd 和 exit 命令都内建于bash shell。可以利用 type 命令来了解某个命令是否是内建的。
  ```bash
  type cd
  type exit
  ```
  * 因为既不需要通过衍生出子进程来执行,也不需要打开程序文件,内建命令的执行速度要更快,效率也更高。
  * 要注意,有些命令有多种实现。例如 echo 和 pwd 既有内建命令也有外部命令。两种实现略有不同。要查看命令的不同实现,使用 type 命令的 -a 选项。
  * 命令 type -a 显示出了每个命令的两种实现。
  * 要使用外部命令 pwd ,可以输入 /bin/pwd 。
  * 一个有用的内建命令是 history 命令.
    * history ,列出使用过的命令列表
    * !! ，执行上一次执行的那个命令
    * !n , 执行history列表中的第n条命令
    * bash命令的历史记录是先存放在内存中,当shell退出时才被写入到历史文件中（.bash_history）。
    * 可以在退出shell会话之前强制将命令历史记录写入.bash_history文件。要实现强制写入,需要使用 history 命令的 -a选 项。
    ```bash
    history -a
    ```
    * 如 果 你 打 开 了 多 个 终 端 会 话 , 仍 然 可 以 使 用 history -a 命 令 在 打 开 的 会 话 中向.bash_history文件中添加记录。但是对于其他打开的终端会话,历史记录并不会自动更新。这是因为.bash_history文件只有在打开首个终端会话时才会被读取。要想强制重新读取.bash_history文件,更新终端会话的历史记录,可以使用 history -n 命令
#### 命令别名 alias    
  * alias 命令是另一个shell的内建命令。命令别名允许你为常用的命令(及其参数)创建另一个名称,从而将输入量减少到最低。
  * 要查看当前可用的别名,使用 alias 命令以及选项 -p 。
  ```bash
  alias
  alias -p
  ```
  * 自定义别名
  ```bash
  alias li='ls -li'
  ```
  * 在定义好别名之后,你随时都可以在shell中使用它,就算在shell脚本中也没问题。要注意,因为命令别名属于内部命令,一个别名仅在它所被定义的shell进程中才有效。

## Linux 环境变量
 * Linux环境变量能帮你提升Linux shell体验。很多程序和脚本都通过环境变量来获取系统信息、存储临时数据和配置信息。在Linux系统上有很多地方可以设置环境变量
  * 环境变量分为两种，全局、局部。
### 全局环境变量
  * 全局环境变量对shell会话和所有的子shell都是可见的。而局部变量只有创建他们的shell可见。
  * 要查看全局变量,可以使用 env 或 printenv 命令。
  * 要显示个别环境变量的值,可以使用 printenv 命令,也可以使用echo,但是不要用 env 命令。
  ```bash
  printenv HOME
  echo $HOME
  ```
  * shell 变量可以直接作为命令参数
    ```bash
    ls $HOME
    ```
### 局部环境变量
  * 局部环境变量只能在创建他的shell中可见。
  * set 命令会显示为某个特定进程设置的所有环境变量,包括局部变量、全局变量以及用户定义变量。  
  * 命令 env 、 printenv 和 set 之间的差异很细微。 set 命令会显示出全局变量、局部变量以及用户定义变量。它还会按照字母顺序对结果进行排序。 env 和 printenv 命令同 set 命令的区别在于前两个命令不会对变量排序,也不会输出局部变量和用户定义变量。在这种情况下, env 和 printenv 的输出是重复的。不过 env 命令有一个 printenv 没有的功能,这使得它要更有用一些。
#### 设置局部用户自定义变量
  * 变量名=变量内容，注意中间不能有空格,内容有空格要用引号引起来。
  ```bash
  my_var_name1=Hello
  my_var_name2='Hello World'
  ```  
  * 变量区分大小写，系统环境变量使用的是全大写，自己定义的尽量使用小写。
  * 设置了局部环境变量后就能在当前shell中使用了，但是不能在子shell中使用。同理在子shell中设置的局部环境变量只能在子shell中使用，无法在父shell中使用。

### 设置全局环境变量
  * 在设置全局环境变量的进程中创建的子进程，该变量是可见的。
  * 全局环境变量创建方法，先创建一个局部环境变量然后把他导出到全局环境变量中去。
    ```bash
    my_var_name=Hello
    export my_var_name
    export my_var_name2="Hello World"
    ```
  * 在子shell中修改全局环境变量并不会影响到父shell中该变量的值。（子shell中有效，单不影响父shell，子shell甚至无法使用 export 命令改变父shell中全局环境变量的值。）  
### 删除环境变量
  * 删除使用 unset 命令
    ```bash
    my_var_name=Hello
    unset my_var_name
    ```
  * 如果你是在子进程中删除了一个全局环境变量,这只对子进程有效。该全局环境变量在父进程中依然可用。

### shell 默认环境变量
  * 简单的一些
    * HOME 当前用户的主目录
    * PATH shell查找命令的目录列表,由冒号分隔
    * PS1 shell命令行界面的主提示符（ [Larry@localhost ～]$ ）
    * PS2 shell命令行界面的次提示符
    * BASH 当前shell实例的全路径名
### PATH 环境变量
  * 当你在shell命令行界面中输入一个外部命令时,shell必须搜索系统来找到对应的程序。 PATH 环境变量定义了用于进行命令和程序查找的目录
  * PATH 中的目录使用冒号分隔
  * 一个用法，如果希望子shell也能找到你的程序的位置,一定要记得把修改后的 PATH 环境变量导出。
    ```bash
    PATH=$PATH:/home/christine/Scripts
    ```
  * 一个用法，把点（.）加入到PATH环境变量中，点（.）表示当前目录。
    ```bash
    PATH=$PATH:.
    ```
### 定位系统环境变量
  * 在你登入Linux系统启动一个bash shell时,默认情况下bash会在几个文件中查找命令。这些文件叫作启动文件或环境文件。bash检查的启动文件取决于你启动bash shell的方式。启动bashshell有3种方式:
    * 登录时作为默认登录shell
    * 作为非登录shell的交互式shell
    * 作为运行脚本的非交互shell
#### 登陆shell
  * 当你登录Linux系统时,bash shell会作为登录shell启动。登录shell会从5个不同的启动文件里读取命令:    
    * /etc/profile
    * $HOME/.bash_profile
    * $HOME/.bashrc
    * $HOME/.bash_login
    * $HOME/.profile  
  * /etc/profile 文件是系统上默认的bash shell的主启动文件。系统上的每个用户登录时都会执行这个启动文件。  
  * 另外4个启动文件是针对用户的,可根据个人需求定制。
  * 这为Linux系统提供了一个放置特定应用程序启动文件的地方,当用户登录时,shell会执行这些文件(例如： /etc/profile.d)
  * Linux发行版在环境文件方面存在的差异非常大。本节中所列出的$HOME下的那些文件并非每个用户都有。例如有些用户可能只有一个$HOME/.bash_profile文件。这很正常。
  * shell会按照按照下列顺序,运行第一个被找到的文件,余下的则被忽略:
    * $HOME/.bash_profile
    * $HOME/.bash_login
    * $HOME/.profile
    * 注意,这个列表中并没有$HOME/.bashrc文件。这是因为该文件通常通过其他文件运行的。
  * $HOME/.bash_profile启动文件会先去检查HOME目录中是不是还有一个叫.bashrc的启动文件。如果有的话,会先执行启动文件里面的命令。

### 交互式shell进程
  * 如果你的bash shell不是登录系统时启动的(比如是在命令行提示符下敲入 bash 时启动),那么你启动的shell叫作交互式shell。交互式shell不会像登录shell一样运行,但它依然提供了命令行提示符来输入命令。
  * 如果bash是作为交互式shell启动的,它就不会访问/etc/profile文件,只会检查用户HOME目录中的.bashrc文件。
  * .bashrc文件有两个作用:一是查看/etc目录下通用的bashrc文件,二是为用户提供一个定制自己的命令别名(参见第5章)和私有脚本函数的地方。
### 非交互式shell
  * 系统执行shell脚本时用的就是这种shell。
  * bash shell提供了 BASH_ENV 环境变量。当shell启动一个非交互式shell进程时,它会检查这个环境变量来查看要执行的启动文件。如果有指定的文件,shell会执行该文件里的命令,这通常包括shell脚本变量设置。(Centos 7 未设置这个环境变量)
  * 那如果 BASH_ENV 变量没有设置,shell脚本到哪里去获得它们的环境变量呢?别忘了有些shell脚本是通过启动一个子shell来执行的。子shell可以继承父shell导出过的变量。举例来说,如果父shell是登录shell,在/etc/profile、/etc/profile.d/ * .sh和$HOME/.bashrc文件中设置并导出了变量,用于执行脚本的子shell就能够继承这些变量。要记住,由父shell设置但并未导出的变量都是局部变量。子shell无法继承局部变量。

### 持久化环境变量
  * 所有用户都需要的全局环境变量
    * /etc/profile文件中，但这可不是什么好主意。如果你升级了所用的发行版,这个文件也会跟着更新,那你所有定制过的变量设置可就都没有了。
    * 最好是在/etc/profile.d目录中创建一个以.sh结尾的文件。把所有新的或修改过的全局环境变量设置放在这个文件中。
  * 存储个人用户永久性bash shell变量的地方是$HOME/.bashrc文件。   
    * alias 命令设置就是不能持久的。你可以把自己的 alias 设置放在$HOME/.bashrc启动文件中,使其效果永久化。

### 数组变量
  * 要给某个环境变量设置多个值,可以把值放在括号里,值与值之间用空格分隔。
    ```bash
    my_var_name=(1 2 3 4 5)
    ```
  * 使用
    ```bash
    echo $my_var_name  # 1,只会输出数组的第一个值
    echo ${ my_var_name[1] } # 2, 指定数组下标
    echo ${ my_var_name[*] } # 1 2 3 4 5,  所有元素
    echo ${ my_var_name[@] } # 1 2 3 4 5,  所有元素
    ```  
  * 删除数组变量
    * 删除单个元素,删除后元素仍占据位置
    ```bash
    my_var_name=(1 2 3 4 5)
    unset my_var_name[2]
    echo ${ my_var_name[*] } # 1 2 4 5
    echo ${ my_var_name[2] } # 输出空
    echo ${ my_var_name[3] } # 4
    ```  
    * 删除整个数组
    ```bash
    unset my_var_name
    ```
  * ${ my_var_name[@] } 与 ${ my_var_name[*] } 在没有加双引号是没有差别，加双引号后有差别 "${ my_var_name[@] }" 代表 "1" "2" "3" "4" "5" 是五个值, "${ my_var_name[*] }" 代表 "1 2 3 4 5" 是一个值。

## Linux 文件权限

### Linux 安全性
  * /etc/passwd ,用户登陆信息
    * 登陆用户名
    * 用户密码 （x）
    * 用户ID UID
    * 用户组ID GID
    * 用户账户描述（备注）
    * 用户的HOME目录所在位置
    * 用户的默认shell
  * /etc/shadow  ,密码相关信息，只有启动程序和root用户可以访问
    * 与/etc/passwd文件中的登录名字段对应的登录名
    * 加密后的密码
    * 自上次修改密码后过去的天数密码(自1970年1月1日开始计算)
    * 多少天后才能更改密码
    * 多少天后必须更改密码
    * 密码过期前提前多少天提醒用户更改密码  
    * 密码过期后多少天禁用用户账户
    * 用户账户被禁用的日期(用自1970年1月1日到当天的天数表示)
    * 预留字段给将来使用
### 用户    
#### 添加用户 useradd
  * 要 root 权限
  * useradd -D ,查看添加用户时的默认值
    * 新用户会被添加到GID为 100 的公共组;
    * 新用户的HOME目录将会位于/home/loginname;
    * 新用户账户密码在过期后不会被禁用;
    * 新用户账户未被设置过期日期;
    * 新用户账户将bash shell作为默认shell;
    * 系统会将/etc/skel目录下的内容复制到用户的HOME目录下;
    * 系统为该用户账户在mail目录下创建一个用于接收邮件的文件。  
  * 在创建新用户时,如果你不在命令行中指定具体的值, useradd 命令就会使用 -D 选项所显示的那些默认值
  * useradd 可选参数
      * -c comment 给新用户添加备注
      * -d home_dir 为主目录指定一个名字(如果不想用登录名作为主目录名的话)
      * -e expire_date 用YYYY-MM-DD格式指定一个账户过期的日期
      * -f inactive_days 指定这个账户密码过期后多少天这个账户被禁用; 0 表示密码一过期就立即禁用, 1 表示禁用这个功能
      * -g initial_group 指定用户登录组的GID或组名
      * -G group ... 指定用户除登录组之外所属的一个或多个附加组
      * -k 必须和 -m 一起使用,将/etc/skel目录的内容复制到用户的HOME目录
      * -m 创建用户的HOME目录
      * -M 不创建用户的HOME目录(当默认设置里要求创建时才使用这个选项)
      * -n 创建一个与用户登录名同名的新组  
      * -r 创建系统账户
      * -p passwd 为用户账户指定默认密码
      * -s shell 指定默认的登录shell
      * -u uid 为账户指定唯一的UID      
  * useradd 更改默认设置（ 默认设置可以通过useradd -D 查看 ）
    * 修改时用 -D 参数 
    * 可更改的默认设置参数
      * -b default_home 更改默认的创建用户HOME目录的位置
      * -e expiration_date 更改默认的新账户的过期日期
      * -f inactive 更改默认的新用户从密码过期到账户被禁用的天数
      * -g group 更改默认的组名称或GID
      * -s shell 更改默认的登录shell
    * 举例，修改默认shell  
    ```bash
    useradd -D -s /bin/tsch
    ```
#### 删除用户    
  * userdel ,默认情况下只删除/etc/passwd文件中的用户信息,而不会删除系统中属于该账户的任何文件。
  * userdel -r ，会删除用户的HOME目录以及邮件目录。然而,系统上仍可能存有已删除用户的其他文件。这在有些环境中会造成问题。
#### 修改用户工具
  * usermod 修改用户账户的字段,还可以指定主要组以及附加组的所属关系
  * passwd 修改已有用户的密码，默认修改自己的密码（root用户可以指定用户修改他人密码）
  * chpasswd 从文件中读取登录名密码对,并更新密码 （ chpasswd < users.txt ,users.txt 是含有 userid:passwd 对的文件）
  * chage 修改密码的过期日期
  * chfn 修改用户账户的备注信息 （ chfn username ）
  * chsh 修改用户账户的默认登录shell （ chsh -s /bin/csh test）
### 组
  * 用户组信息保存在 /etc/group 文件里
  * 组文件包含四个字段
    * 组名
    * 组密码
    * 组ID
    * 属于改组的用户列表
      * 用户账户列表某种意义上有些误导人。你会发现,在列表中,有些组并没有列出用户。这并不是说这些组没有成员。当一个用户在/etc/passwd文件中指定某个组作为默认组时,用户账户不会作为该组成员再出现在/etc/group文件中。多年以来,被这个问题难倒的系统管理员可不是一两个呢。
#### 创建组 groupadd
  * groupadd  [options] GROUP
  * 在创建新组时,默认没有用户被分配到该组。 groupadd 命令没有提供将用户添加到组中的选项,但可以用 usermod 命令来弥补这一点  
  * 如果更改了已登录系统账户所属的用户组,该用户必须登出系统后再登录,组关系的更改才能生效。  
  * 为用户账户分配组时要格外小心。如果加了 -g 选项,指定的组名会替换掉该账户的默认组。 -G 选项则将该组添加到用户的属组的列表里,不会影响默认组。
#### 修改组 groupmod

### 文件权限
  * ls -l 列出文件详细信息
    * - 代表文件
    * d 代表目录
    * l 代表链接
    * c 代表字符型设备
    * b 代表块设备
    * n 代表网络设备
    * 之后有3组三字符的编码。每一组定义了3种访问权限:
      * r 代表对象是可读的
      * w 代表对象是可写的  
      * x 代表对象是可执行的
      * 若没有某种权限,在该权限位会出现单破折线。
    * 这3组权限分别对应对象的3个安全级别  
      *  对象的属主
      * 对象的属组
      * 系统其他用户  
  * 文件或目录的默认权限
    * 默认权限由 umask 值控制，计算方法是文件或目录的全权限减去umask后三位的值。
    * umask 第一位值代表了一项特别的安全特性,叫作粘着位。后面的3位表示文件或目录对应的 umask 八进制值。
    * 文件的全权限是666。
    * 目录的全权限是777。
    * umask 值修改， umask new_value
      ```bash
      umask 006
      ```
#### 改变文件权限 chmod
  * 例子
    * chmod 755  file
    * chmod +x file
    * chmod u+x file  ,u+x 要连起来写
    * chmod -w file
    * chmod [ugoa][[+-=][rwxXstugo]  file
  * 第一组选项信息
    * u 代表用户
    * g 代表组
    * o 代表其他
    * a 代表上述所有   
  * 第二组参数信息
    * X :如果对象是目录或者它已有执行权限,赋予执行权限。
    * s :运行时重新设置UID或GID。
    * t :保留文件或目录。
    * u :将权限设置为跟属主一样。
    * g :将权限设置为跟属组一样。
    * o :将权限设置为跟其他用户一样  
#### 改变所属关系 chown,chgrp
  * chown 命令格式：
    * chown options owner[.group] file
  * 例子
    * chown dan newfile
    * chown dan.shared newfile
    * chown .rich newfile  
    * chown test. newfile （如果你的Linux系统采用和用户登录名匹配的组名,可以只用一个条目就改变二者）
  * 选项
    * -R 选项配合通配符可以递归地改变子目录和文件的所属关系。
    * -h 选项可以改变该文件的所有符号链接文件的所属关系。
  * chgrp 命令可以更改文件或目录的默认属组。  
    * chgrp shared newfile
#### 同组用户共享文件    
  * Linux系统上共享文件的方法是创建组，但在一个完整的共享文件的环境中,事情会复杂得多。
  * 创建新文件时,Linux会用你默认的UID和GID给文件分配权限。想让其他人也能访问文件,要么改变其他用户所在安全组的访问权限,要么就给文件分配一个包含其他用户的新默认属组。
  * 如果你想在大范围环境中创建文档并将文档与人共享,这会很烦琐。幸好有一种简单的方法可以解决这个问题。
  * Linux还为每个文件和目录存储了3个额外的信息位。
    * 设置用户ID(SUID):当文件被用户使用时,程序会以文件属主的权限运行。
    * 设置组ID(SGID):对文件来说,程序会以文件属组的权限运行;对目录来说,目录中创建的新文件会以目录的默认属组作为默认属组。
    * 粘着位:进程结束后文件还驻留(粘着)在内存中。
  * SGID位对文件共享非常重要。启用SGID位后,你可以强制在一个共享目录下创建的新文件    都属于该目录的属组,这个组也就成为了每个用户的属组。
  * SGID可通过 chmod 命令设置。它会加到标准3位八进制值之前(组成4位八进制值),或者在符号模式下用符号 s 。
  * 实例：
  ```bash
  mkdir testdir
  chgrp shared testdir
  chmod g+s testdir
  ```
  * 首先,用 mkdir 命令来创建希望共享的目录。然后通过 chgrp 命令将目录的默认属组改为包含所有需要共享文件的用户的组(你必须是该组的成员)。最后,将目录的SGID位置位,以保证目录中新建文件都用shared作为默认属组。

## 软件管理
  * yum install package_name , 安装包
  * yum localinstall  package_name.rpm , 本地安装
    * yum install package_name.rpm ，也可以安装本地包
  * yum list installed  ， 列出已安装的包
  * yum list gcc , 查看某个包是否已经安装
  * yum provides  file_name 查找某个特定文件属于那个软件包
    ```bash
    yum provides  /etc/yum.conf
    ```
  * yum list updates ，列出已安装软件包的可用更新  
  * yum update package_name, 更新指定软件
  * yum update ， 更新所有软件
  * yum remove  package_name, 删除指定软件（删除软件和相关文件）
    * yum erase package_name, 删除指定软件（删除软件和相关文件）
  * yum clean all  ,处理损坏的包依赖关系。有时在安装多个软件包时,某个包的软件依赖关系可能会被另一个包的安装覆盖掉。这叫作损坏的包依赖关系(broken dependency),然后试着用 yum 命令的 update 选项。有时,只要清理了放错位置的文件就可以了。
  * yum deplist package_name ，这个命令显示了所有包的库依赖关系以及什么软件可以提供这些库依赖关系。
    * yum update --skip-broken ，--skip-broken 选项允许你忽略依赖关系损坏的那个包,继续去更新其他软件包。这可能救不了损坏的包,但至少可以更新系统上的其他包。
  * yum repolist ，列出你现在正从哪些仓库中获取软件

## 编辑器
### vim
  * vim 编辑器有两种模式
    * 普通模式 （ 刚打开时 ）
    * 插入模式  （ 普通模式按i键切换到插入模式，插入模式按Esc键切换到普通模式 ）
  * 普通模式下可以使用方向键控制光标移动，也可以使用hjkl键移动（没有方向键的情况）。
  * 普通模式快速定位
    * PageDown 、PageUp ，上下翻页
    * G ， 移动到缓冲区的最后一行
    * num G，移动到缓冲区的第 num 行。
    * gg ，移动到缓冲区的第一行
  * 普通模式下有一个特别的功能叫做命令行模式。
    * 在普通模式下按下冒号（：）键，出现命令行模式。
    * q ，  如果未修改缓冲区数据,退出。
    * q! ，取消所有对缓冲区数据的修改并退出。
    * w filename ，将文件保存到另一个文件中。
    * wq :将缓冲区数据保存到文件中并退出。
  * 普通模式下的一些命令  
    * 删除当前光标所在位置的字符
    * dd 删除当前光标所在行
    * dw 删除当前光标所在位置的单词
    * d$ 删除当前光标所在位置至行尾的内容
    * J 删除当前光标所在行行尾的换行符(拼接行)
    * u 撤销前一编辑命令
    * a 在当前光标后追加数据
    * A 在当前光标所在行行尾追加数据
    * r char 用 char 替换当前光标所在位置的单个字符
    * R text 用 text 覆盖当前光标所在位置的数据,直到按下ESC键  
    * 有些编辑命令允许使用数字修饰符来指定重复该命令多少次。比如,命令 2x 会删除从光标当前位置开始的两个字符,命令 5dd 会删除从光标当前所在行开始的5行。
    * 在vim编辑器的普通模式下使用退格键(Backspace键)和删除键(Delete键)时要留心。vim编辑器通常会将删除键识别成 x 命令的功能,删除当前光标所在位置的字符，vim编辑器在普通模式下通常不识别退格键。
  * 复制和粘贴
    * 粘贴的命令是 p，他可以和任何删除命令结合使用，删除命令会把删除的内容放到单独的存储器中。
    * 复制文本命令是 y (yank)，可以在y后面使用和d命令相同的第二个字符，例如dw表示删除一个单词，yw表示复制一个单词。
      * yw表示复制一个单词。
      * y$ 表示复制到行尾。
    * 选择复制
      * 先按下v键，这是移动光标高亮显示选中的文本
      * 然后按y键，复制选中的内容，p键粘贴内容。  
  * 查找和替换
    * 查找，第一步 按 / 键 ，或者在命令行模式输入 / ，第二步在 / 后面输入查找的内容。
    * 查找有三种回应方式。
      * 1、如果要查找的文本出现在光标当前位置之后,则光标会跳到该文本出现的第一个位置。
      * 2、如果要查找的文本未在光标当前位置之后出现,则光标会绕过文件末尾,出现在该文本所在的第一个位置(并用一条消息指明)
      * 3、输出一条错误消息,说明在文件中没有找到要查找的文本。
      * 查找是从查找时光标当前的位置后面开始的，如果光标前面后面都有要查找的内容，则查出的内容是当时光标后面的内容。
      * 多个内容时，定位到下一个
        * 方法一，在次按/键然后按Enter键（不用输入内容）
        * 方法二，按n键（next）。
    * 替换，替换要在命令行模式下进行。命令格式如下：
      * :s/old/new/  ：替换当前行的一个old。
      * :s/old/new/g :替换当前行的所有 old 。
      * :n,ms/old/new/g :替换行号 n 和 m 之间所有 old 。
      * :%s/old/new/g :替换整个文件中的所有 old 。
      * %s/old/new/gc :替换整个文件中的所有 old ,但在每次出现时提示。
## Shell 编程

### 使用多个命令
  * shell可以让你将多个命令串起来,一次执行完成。如果要两个命令一起运行,可以把它们放在同一行中,彼此间用分号隔开。（每一行的内容不要太多）
### 创建shell脚本文件
  * 在创建shell脚本文件时,必须在文件的第一行指定要使用的shell。其格式为:
    ```text
    #!/bin/bash
    ```
  * 在shell脚本中 # 表示注释  
  * 如果在一行写两个或多个命令时要使用分号隔开。
    ```bash
    #!/bin/bash
    who
    pwd
    date ; ls
    ```
  * shell 脚本中的命令按顺序执行。
  * 执行脚本
    ```bash
    chmod u+x  test.sh
    ./test.sh
    ```
  * echo 输出
    ```bash
    echo This is test 
    echo "This is a test"
    echo 'This is a test'
    echo "This is a 'test'" 
    echo 'This is a "test"'
    echo -n "This is a test" # 不换行
    echo "The cost of the item is \$15"
    ```  
  * 用户变量
    * 字母、数字、下划线组成。
    * 系统环境变量一般是全大写，自定义变量尽量不要全大写。
    * 变量区分大小写
    * 变量不能数字开头
    * 变量、等号、值三者之间不能有空格。
      ```bash
      n1=100
      n2=$n1
      ```
    * 变量值有多个单词组成时要用引号（单引号或双引号）引起来
      * 单因号的值会原样输出，无法引用变量
      * 双引号内可以使用变量
        ```bash
        name=Larry
        greeting="Hello $name"
        greeting="Hello ${name}"
        PATH="$PATH:/aa/bb"
        ```
    * 使用变量要用$符
      * $var_name
      * ${var_name} ，不能有空格    
###  命令替换
  * shell脚本中最有用的特性之一就是可以从命令输出中提取信息,并将其赋给变量 
    * 方法一、使用反引号 ``
      ```bash
      dt=`date`
      echo $dt
      ```
    * 方法二、使用$小括号 $()
      ```bash
      dt=$(date)
      echo $dt
      ```
  * 一个例子
    ```bash
    #!/bin/bash
    # copy the /usr/bin directory listing to a log file
    today=$(date +%y%m%d)
    ls /usr/bin -al > log.$today
    ```
  * 命令替换会创建一个子shell来运行对应的命令。

### 输入输出重定向
  * > ，输出重定向（覆盖）
  * >> ，输出重定向（追加）
  * <  ，输入重定向
  * << ，内联输入重定向
    * 在命令行上使用内联输入重定向时,shell会用 PS2 环境变量中定义的次提示符（>）
    ```bash
    wc << EOF
    > test string 1
    > test string 2
    > test string 3
    EOF
    ```  
### 管道
  * 管道符 |
  * 上一个命令执行的结果作为输入传递给下一个命令
    ```bash
    ls -l | sort | more
    ```  
  * 管道搭配重定向
    ```bash
    rpm -qa | sort > rpm.list
    ```    
  * 到目前为止,管道最流行的用法之一是将命令产生的大量输出通过管道传送给 more 命令。这对 ls 命令来说尤为常见  

###  在shell中执行数学运算
  * bash shell数学运算符只支持整数运算,若结果是小数则取整。（z shell(zsh)提供了完整的浮点数算术操作,也可以使用bc程序）
  * 在bash中执行数学运算比较麻烦，但是有两种方式
    * 通过 expr 命令 
      ```bash
      res=`expr 1 + 1`  # + (运算符) 两边要有空格
      ```
       ```bash
      res=$( expr 8 / 2 )
      ```
      ```bash
      res=`expr 2 \* 3`  # 乘法运算要转义
      ```
    * 使用 $[  ] 的方式，[]内是数学表达式，
      ```bash
      res=$[1+1]  # [] 内以及运算符两边不是必须有空格，乘法运算也不需要转义*
      ```
      ```bash
      n1=100
      n2=50
      n3=45
      res=$[ $n1 * ( $n2 - $n3 ) ]
      ```
  * expr 命令的方式是为了兼容 Bourne  shell，支持少数的数学运算和字符串操作
    * ARG1 | ARG2 如果 ARG1 既不是null也不是零值,返回 ARG1 ;否则返回 ARG2
    * ARG1 & ARG2 如果没有参数是null或零值,返回 ARG1 ;否则返回 0
    * ARG1 < ARG2 如果 ARG1 小于 ARG2 ,返回 1 ;否则返回 0
    * ARG1 <= ARG2 如果 ARG1 小于或等于 ARG2 ,返回 1 ;否则返回 0
    * ARG1 = ARG2 如果 ARG1 等于 ARG2 ,返回 1 ;否则返回 0
    * ARG1 != ARG2 如果 ARG1 不等于 ARG2 ,返回 1 ;否则返回 0
    * ARG1 >= ARG2 如果 ARG1 大于或等于 ARG2 ,返回 1 ;否则返回 0
    * ARG1 > ARG2 如果 ARG1 大于 ARG2 ,返回 1 ;否则返回 0
    * ARG1 + ARG2 返回 ARG1 和 ARG2 的算术运算和
    * ARG1 - ARG2 返回 ARG1 和 ARG2 的算术运算差
    * ARG1 * ARG2 返回 ARG1 和 ARG2 的算术乘积
    * ARG1 / ARG2 返回 ARG1 被 ARG2 除的算术商
    * ARG1 % ARG2 返回 ARG1 被 ARG2 除的算术余数
    * STRING : REGEXP 如果 REGEXP 匹配到了 STRING 中的某个模式,返回该模式匹配
    * match STRING REGEXP 如果 REGEXP 匹配到了 STRING 中的某个模式,返回该模式匹配
    * substr STRING POS LENGTH 返回起始位置为 POS (从 1 开始计数)、长度为 LENGTH 个字符的子字符串
    * index STRING CHARS 返回在 STRING 中找到 CHARS 字符串的位置;否则,返回 0
    * length STRING 返回字符串 STRING 的数值长度
    * + TOKEN 将 TOKEN 解释成字符串,即使是个关键字
    * (EXPRESSION) 返回 EXPRESSION 的值
  * 使用bc进行浮点运算
    * 安装bc
      ```bash
      sudo yum install bc -y
      ```
    * bash计算器实际上是一种编程语言,它允许在命令行中输入浮点表达式,然后解释并计算该表达式,最后返回结果。bash计算器能够识别:  
      * 数字(整数和浮点数)
      * 变量(简单变量和数组)
      * 注释(以#或C语言中的 /* */ 开始的行)
      * 表达式
      * 编程语句(例如 if-then 语句)
      * 函数
    * shell 中直接输入bc 就能使用bc计算器了  
      * 输入 quit 退出。
      * 浮点运算是由内建变量 scale 控制的，默认值为0，若要保留4位小数输入 scale=4
      * 启动 bc 是可以使用 -q 参数，表示不显示欢迎信息。
    * 在shell脚本中使用bc
      * 语法（使用的是命令替换）
        * variable=$(echo "options; expression" | bc)
        * 第一部分 options 允许你设置变量。如果你需要不止一个变量,可以用分号将其分开。
        * expression 参数定义了通过 bc 执行的数学表达式。
    * 例子    
      ```text
      #!/bin/bash
      var1=$(echo "scale=4; 3.44 / 5" | bc)
      echo The answer is $var1
      ```
      ```text
      #!/bin/bash
      var1=10.46
      var2=43.67
      var3=33.2
      var4=71
      var5=$(bc << EOF
      scale = 4
      a1 = ( $var1 * $var2)
      b1 = ($var3 * $var4)
      a1 + b1
      EOF
      )
      echo The final answer for this mess is $var5
      ```
      ```text
      # 内联重定向说明
      variable=$(bc << EOF
      options
      statements
      expressions
      EOF
      )
      ```
### 退出脚本
  * 没有指定退出时，运行完最后一条命令时,脚本就结束了。其实还有另外一种更优雅的方法可以为脚本划上一个句号。
  * hell中运行的每个命令都使用退出状态码(exit status)告诉shell它已经运行完毕。退出状态码是一个0~255的整数值,在命令结束运行时由命令传给shell。可以捕获这个值并在脚本中使用。
#### 查看退出状态码  
  * Linux提供了一个专门的变量 $? 来保存上个已执行命令的退出状态码。
    ````bash
    date
    echo $?
    ```
  * 按照惯例,一个成功结束的命令的退出状态码是 0 。  
  * 无效命令会返回一个退出状态码 127。
  * Linux 状态码
    * 0 命令成功结束
    * 1 一般性未知错误
    * 2 不适合的shell命令
    * 126 命令不可执行
    * 127 没找到命令
    * 128 无效的退出参数
    * 128+x 与Linux信号x相关的严重错误
    * 130 通过Ctrl+C终止的命令
    * 255 正常范围之外的退出状态码
#### exit 命令
  * exit 命令可以指定退出状态码    
    ```bash
    exit 5
    ```
    ```text
    #!/bin/bash
    echo Hello
    exit 100
    ```
  * 退出状态码最大只能是 255，退出状态码被缩减到了0~255的区间。shell通过模运算得到这个结果。一个值的模就是被除后的余数。最终的结果是指定的数值除以256后得到的余数

## shell 流程控制，结构化命令
  * if-then
  * if-then-else
  * if-then-elif-then
  * case
  * 可以嵌套
### if-then
  * 格式：  
    ```text
    if  command
    then
      command
    fi  
    ```
    ```text
    if  command ; then
      command
    fi  
    ```
  * bash shell的 if 语句会运行 if 后面的那个命令。如果该命令的退出状态码(参见第11章)是 0(该命令成功运行),位于 then 部分的命令就会被执行。 如果该命令的退出状态码是其他值, then部分的命令就不会被执行。
  * fi 语句用来表示 if-then语句到此结束。
  * 例子：
    ```text
    #!/bin/bash
    # testing the if statement
    if pwd
    then
      echo "It worked"
    fi
    ```
### if-then-else
  * 语法
    ```text
    if command
    then
      commands
    else
      commands
    fi
    ```    
### if-then-elif-then
  * 语法
  ```text
  if command1
  then
    commands
  elif command2
  then
    more commands
  fi
  ```    
### test  命令
  * if-then 语句不能测试命令退出状态码之外的条件
  * test命令提供了在if-then语句中测试不同条件的途径。如果test命令后列出的条件成立，则test命令就会退出并返回状态码0，否则返回非0的状态码。
  * test命令格式是：test condition
    ```text
    if test condition
    then
      command
    fi  
    ```
  * 另一种测试方法 [  ]，无需使用test命令,注意[  ] 要有空格，否则会报错。方括号是与 test 命令同义的特殊bash命令
    ```text
    if [ condition ]
    then
      command
    fi  
    ```
#### 使用test 进行数值比较，数值必须是整数，浮点数会报错。
  * n1 -eq n2 检查 n1 是否与 n2 相等
  * n1 -ge n2 检查 n1 是否大于或等于 n2
  * n1 -gt n2 检查 n1 是否大于 n2
  * n1 -le n2 检查 n1 是否小于或等于 n2
  * n1 -lt n2 检查 n1 是否小于 n2
  * n1 -ne n2 检查 n1 是否不等于 n2 
#### 使用test进行字符串比较       
  * str1 = str2 检查 str1 是否和 str2 相同
  * str1 != str2 检查 str1 是否和 str2 不同
  * str1 < str2 检查 str1 是否比 str2 小 （ 默认当作重定向，使用时需要转义 ）
  * str1 > str2 检查 str1 是否比 str2 大 （使用时需要转义）
  * -n str1 检查 str1 的长度是否非0
  * -z str1 检查 str1 的长度是否为0

  * 两点注意：
    * 1、大小比较时要转义 < >
    * 2、大小比较时 test 的比较方法与sort的比较方法不同。
      * test 大写字母被认为是小于小写字母的。但 sort 命令恰好相反
      * 比较测试中使用的是标准的ASCII顺序,根据每个字符的ASCII数值来决定排序结果。 sort命令使用的是系统的本地化语言设置中定义的排序顺序。对于英语,本地化设置指定了在排序顺序中小写字母出现在大写字母前。
  * test 命令和测试表达式使用标准的数学比较符号来表示字符串比较,而用文本代码来表示数值比较。这个细微的特性被很多程序员理解反了。如果你对数值使用了数学运算符号,shell会将它们当成字符串值,可能无法得到正确的结果。 
  * 空的和未初始化的变量会对shell脚本测试造成灾难性的影响。如果不是很确定一个变量的内容,最好在将其用于数值或字符串比较之前先通过 -n 或 -z 来测试一下变量是否含有值。   
#### test 文件比较
  * 测试Linux文件系统上文件和目录的状态
    * -d file 检查 file 是否存在并是一个目录
    * -e file 检查 file 是否存在
    * -f file 检查 file 是否存在并是一个文件
    * -r file 检查 file 是否存在并可读
    * -s file 检查 file 是否存在并非空
    * -w file 检查 file 是否存在并可写
    * -x file 检查 file 是否存在并可执行
    * -O file 检查 file 是否存在并属当前用户所有
    * -G file 检查 file 是否存在并且默认组与当前用户相同
    * file1 -nt file2 检查 file1 是否比 file2 新
    * file1 -ot file2 检查 file1 是否比 file2 旧
#### 复合测试条件
  * if-then 语句允许你使用布尔逻辑来组合测试
    * [ condition1 ] && [ condition2 ]
    * [ condition1 ] || [ condition2 ]
    * test condition1 && test condition2
    * test condition1 || test condition2
  * 例子：
    ```text
    #!/bin/bash
    if [ -d $HOME/aa ]  && [ $USER == test]
    then
      echo OK
    else
      echo not OK  
    fi
    ```
#### if-then 的高级特性
  * 两个高级特性
    * 用于数学表达式的双括号 (( expression ))      
    * 用于高级字符串处理的双方括号 [[ expression ]]
  * 双括号命令符号(()),其中的表达式用法同其他编程语言
    * val++ 后增 ,
    * val-- 后减  ，
    * ++val 先增 ，
    * --val 先减 ，
    * ! 逻辑求反
    * ~ 位求反
    * ** 幂运算
    * << 左位移
    * >> 右位移
    * & 位布尔和
    * | 位布尔或
    * && 逻辑和
    * || 逻辑或 
  * 双方括号 [[]]  里的 expression 使用了test命令中采用的标准字符串比较。但是它提供了另一个特性——模式匹配
    ```text
    if [[ $USER == t* ]]
    then
      echo OK
    else
      echo Not OK
    fi    
    ```
  * 双方括号在bash shell中工作良好。不过要小心,不是所有的shell都支持双方括号。

### case
  * 格式：      
    ```text
    case    $var_name   in
    pattern1 | pattern2) 
      commands
    ;;
    pattern3) 
      commands
    ;;
    *) 
      dufault commands
    ;;
    esac
    ``` 
## 循环
  * for
  * while
  * until
### for 循环
  * 格式
  ```text
  for var_name in value_list
  do
    commands
  done
  ```  
  ```text
  for var_name in value_list ; do
    commands
  done
  ```  
  * 例子：
  ```text
  #!/bin/bash
  names=(Larry Herry Tom)
  for name in "${names[@]}"
  do
    echo $name
  done  
  ```
  ```text
  #!/bin/bash
  for name in Larry Herry Tom
  do
    echo $name
  done  
  echo $name # 变量依然存在
  ```
  * 引号特例
  ```text
  #!/bin/bash
  for name in I Don't know if this'll work
  do
    echo $name
  done  
  ```
  ```text
  #!/bin/bash
  for name in I Don\'t know if "this'll" work
  do
    echo $name
  done  
  ```
  * 从变量读取列表
    ```text
    #!/bin/bash
    names="Larry Herry Tom"
    names=$names" Jone"
    for name in $names
    do
      echo $name
    done  
    ```
    ```text
    #!/bin/bash
    names=(Larry Herry Tom)
    for name in ${names[*]}
    do
      echo $name
    done  
    ```
#### 修改字段分隔符
  * 默认情况下bash shell 会将下列字符当作字段分隔符
    * 空格
    * 制表符
    * 还行符
  * 可以通过修改特殊环境变量IFS来设置指定的字段分隔符    
    ```bash
    IFS=$'\n'
    ```
  * 例如在处理可能含有空格的数据(比如文件名)时,使用默认的IFS会非常麻烦 。
    ```text
    #!/bin/bash
    file=states
    oldIFS=$IFS # 备份IFS
    IFS=$'\n'
    for state in $(cat $file)
    do
      echo $state
    done 
    IFS=$oldIFS # 设置回原来的值
    ```
    * 在处理代码量较大的脚本时,可能在一个地方需要修改 IFS 的值,然后忽略这次修改,在脚本的其他地方继续沿用 IFS 的默认值。一个可参考的安全实践是在改变 IFS 之前保存原来的 IFS 值,之后再恢复它。
    * 如果要为IFS设置多个值，只要将他们的值串联起来即可。
      ```bash
      IFS=$'\n':;" 
      ```
      * 上面为IFS设置了四个值： 还行符、冒号、分号、双引号
#### 使用通配符读取目录
  * 如果不知道所有的文件名,这个特性在处理目录中的文件时就非常好用。
  ```bash
  for file in /home/test/download/*
  do
    if [ -d $file ]
    then
      echo "$file is a dir"
    elif [ -f $file ]  
    then
      echo "$file is file"
    fi
  done    
  ```      
#### bash类C语言风格的for循环
  * 格式：
    * for (( variable assignment ; condition ; iteration process ))
  * 例子：
    ```bash
    for (( i = 0; i < 10; i++ ))
    do
      echo $i
    done  
    ```  
    ```bash
    nameArr=(Larry Herry Tom Jone)
    for (( i = 0; i < ${#nameArr[*]}; i++ ))
    do
      echo ${nameArr[i]}
    done  
    ```  
##### for循环时使用多个变量
  * C语言风格的 for 命令也允许为迭代使用多个变量。循环会单独处理每个变量,你可以为每个变量定义不同的迭代过程。尽管可以使用多个变量,但你只能在 for 循环中定义一种条件。
    ```bash
    for (( i = 0, j = 10; i < 10; i++ ,j-- ))
    do
      echo "$i --- $j"
    done  
    ```
### while 循环
  * 格式：
    ```text
    while test command
    do
      commands
    done  
    ```    
  * while 命令中定义的 test command 和 if-then 语句中的格式一模一样
  * 注意：while 命令允许你在 while 语句行定义多个测试命令。只有最后一个测试命令的退出状态码会被用来决定什么时候结束循环。如果你不够小心,可能会导致一些有意思的结果。
    ```text
    #!/bin/bash
    # testing a multicommand while loop
    var1=10
    while echo $var1
            [ $var1 -ge 0 ]
    do
      echo "This is inside the loop"
      var1=$[ $var1 - 1 ]
    done
    ```
### until 循环
  * 格式：
    ```text
    until test command
    do
      commands
    done  
    ```
  * 可以在until 命令语句中放入多个测试命令。只有最后一个命令的退出状态码决定了bash shell是否继续执行。
### 嵌套循环
  * 与其他语言类似，循环可以嵌套
### 循环处理文件数据
  ```bash
  oldIFS=$IFS
  IFS=$'\n'
  for entry in $(cat /etc/passwd)
  do
    echo "Values in $entry "
    IFS=:
    for value in $entry
    do
      echo "    $value"
    done
  done
  IFS=oldIFS     
  ```
### 循环控制
  * break
    * 默认退出当前正在执行的循环
    * break 可以接受一个参数 n（默认为1），n是正整数表示要停止第n层循环（嵌套循环的情况），如果你将 n 设为 2 , break 命令就会停止下一级的外部循环（内部也同时停掉了，仿佛是C语言的goto到了外层的done）
  * continue  
    * 停止本次循环进入下一次循环
    * 与break一样continue也可以指定参数n
### 处理循环输出（循环输出的重定向）    
  * 在shell脚本中，你可以对循环的输出使用管道或重定向，管道或重定向写在done之后
    ```text
    for test command
    do
      commands
      echo "Somthing"
    done > out.txt 
    ```   
    ```text
    for test command
    do
      commands
      echo "Somthing"
    done | grep ing | sort
    ```   
### 循环实例
  * 查找可执行文件
    ```bash
    IFS=:
    for dir in $PATH
    do
      echo "$dir"
      for file in $dir/*
      do
        if [ -x $file ]
        then
          echo "    $file"
        fi
      done
    done
    ```
  * 创建多个用户账户
    * 输入文件每一行的格式为:  userid,user  name
    ```bash
    input="users.csv"
    while IFS=',' read -r userid name
    do
      echo "adding $userid"
      useradd -c "$name" -m $userid
    done < "$input"
    ```  
## 处理用户输入

### 命令行参数
  * 使用 $n   的方式获取命令行参数
    ```bash
    ./add.sh  10 20
    ```
    * $0 执行时使用的脚本路径，对应上面命令的 ./add.sh,( 根据执行方式的不同只可能不同：add.sh 、 /home/test/add.sh )
      * 如果只需要文件名称（去除路径），可以使用basename 命令获取
        ```bash
        name=$(basename $0)
        ```
    * $1 是第一个参数，对应上面命令的 10
    * $2 是第一个参数，对应上面命令的 20
    * 以此类推 
    * $* 或 $@ 参数列表，对应上面命令的 10 20
    * $# 参数个数，对应上面的命令值为 2。
    * 参数以空格分隔，如果参数含有空格需要使用引号引起来。
    * 在条件语句中使用 $1 等变量时尽量加双引号 "$1" ，否则有可能会报错，例如我在使用 if [ $1 == admin ] 时，且运行脚本没有传递参数的情况报错。
#### shift 移动命令行参数
  * 在使用 shift 命令时,默认情况下它会将每个参数变量向左移动一个位置
  * shift 也可以接受一个参数来指定移动几个位置。
  * 例子
    ```bash
    echo "$1"
    shift
    echo "$1"
    ```
    ```bash
    echo "$1"
    shift 2
    echo "$1"
    ```
    ```bash
    while [ -n "$1" ]
    do
      echo "$1"
      shift
    done  
    ```
  * 使用 shift 命令的时候要小心。如果某个参数被移出,它的值就被丢弃了,无法再恢复。
### 处理选项
#### 查找选项
  * 例子1，处理单选项
  ```bash
  #!/bin/bash
  # extracting command line options as parameters
  #
  echo
  while [ -n "$1" ]
  do
    case "$1" in
      -a) echo "Found the -a option" ;;
      -b) echo "Found the -b option" ;;
      -c) echo "Found the -c option" ;;
      *) echo "$1 is not an option" ;;
    esac
    shift
  done  
  # ./test.sh -c -a -b
  ```
  * 例子2、分离参数和选项
    * 你会经常遇到想在shell脚本中同时使用选项和参数的情况。Linux中处理这个问题的标准方式是用特殊字符来将二者分开,该字符会告诉脚本何时选项结束以及普通参数何时开始。
    * 这个特殊字符是双破折线( -- )
    ```bash
    #!/bin/bash
    # extracting options and parameters
    echo
    while [ -n "$1" ]
    do
      case "$1" in
        -a) echo "Found the -a option" ;;
        -b) echo "Found the -b option";;
        -c) echo "Found the -c option" ;;
        --) shift
            break ;;
        *) echo "$1 is not an option";;
        esac
      shift
    done  
    # ./test.sh -c -a -b -- test1 test2 test3  
    ```
  * 例子3、处理带值的选项
    ```bash
    #!/bin/bash
    # extracting command line options and values
    echo
    while [ -n "$1" ]
    do
      case "$1" in
      -a) echo "Found the -a option";;
      -b) param="$2"
          echo "Found the -b option, with parameter value $param"
          shift ;;
      -c) echo "Found the -c option";;
      --) shift
          break ;;
      *) echo "$1 is not an option";;
      esac
      shift
    done  
    # ./test.sh -a -b test1 -d  
    ```  
  * 现在shell脚本中已经有了处理命令行选项的基本能力,但还有一些限制。比如,如果你想将多个选项放进一个参数中时,它就不能工作了  
  * 在Linux中,合并选项是一个很常见的用法,而且如果脚本想要对用户更友好一些,也要给用户提供这种特性。幸好,有另外一种处理选项的方法能够帮忙。
#### 使用 getopt 命令  
  * getopt 命令可以接受一系列任意形式的命令行选项和参数,并自动将它们转换成适当的格式。它的命令格式如下:
    * getopt optstring parameters
    * optstring 是这个过程的关键所在。它定义了命令行有效的选项字母,还定义了哪些选项字母需要参数值。
    * 首先,在 optstring 中列出你要在脚本中用到的每个命令行选项字母。然后,在每个需要参数值的选项字母后加一个冒号。 getopt 命令会基于你定义的 optstring 解析提供的参数。
    * getopt 命令有一个更高级的版本叫作 getopts (注意这是复数形式)
    * 例子： 
      * getopt ab:cd -a -b test1 -cd test2 test3
      * 处理结果： -a -b test1 -c -d -- test2 test3
      * optstring 定义了四个有效选项字母: a 、 b 、 c 和 d 。冒号( : )被放在了字母 b 后面,因为 b选项需要一个参数值。
    * 如果指定了一个不在 optstring 中的选项,默认情况下, getopt 命令会产生一条错误消息。如果想忽略这条错误消息,可以在命令后加 -q 选项。
      * getopt -q ab:cd -a -b test1 -cde test2 test3
    * 例子
      ```bash
      # Extract command line options & values with getopt
      #
      set -- $(getopt -q ab:cd "$@")
      #
      echo
      while [ -n "$1" ]
      do
        case "$1" in
        -a) echo "Found the -a option" ;;
        -b) param="$2"
            echo "Found the -b option, with parameter value $param"
            shift ;;
        -c) echo "Found the -c option" ;;
            --) shift
            break ;;
        *) echo "$1 is not an option";;
        esac
        shift
        done
        #
        count=1
        for param in "$@"
        do
          echo "Parameter #$count: $param"
          count=$[ $count + 1 ]
        done
      ```
  * getopt 命令并不擅长处理带空格和引号的参数值。它会将空格当作参数分隔符,而不是根据双引号将二者当作一个参数。幸而还有另外一个办法能解决这个问题。
    * ./test.sh -a -b test1 -cd "test2 test3" test4
####  使用更高级的 getopts  
  * getopts 命令(注意是复数)内建于bash shell。它跟近亲 getopt 看起来很像,但多了一些扩展功能。

### 将选项标准化
  * 有些字母选项在Linux世界里已经拥有了某种程度的标准含义。如果你能在shell脚本中支持这些选项,脚本看起来能更友好一些。
    *  -a 显示所有对象
    *  -c 生成一个计数
    *  -d 指定一个目录
    *  -e 扩展一个对象
    *  -f 指定读入数据的文件
    *  -h 显示命令的帮助信息
    *  -i 忽略文本大小写
    *  -l 产生输出的长格式版本
    *  -n 使用非交互模式(批处理)
    *  -o 将所有输出重定向到的指定的输出文件
    *  -q 以安静模式运行
    *  -r 递归地处理目录和文件
    *  -s 以安静模式运行
    *  -v 生成详细输出
    *  -x 排除某个对象
    *  -y 对所有问题回答yes  
### 读取用户输入 read
  * 格式
    * read [options]  [var_name ...]
      ```bash
      read name
      read firstName lastName
      read -p "请输入年龄： " age
      echo $name
      echo $age
      ```
     * 选项
      * -p "提示信息"  ( 提示信息也可以使用echo打印，如果需要提示信息和输入为值在同一行可以使用echo -n  )
      ```bash
      read -p "请输入姓名： " name
      echo -n "请输入姓名：" name
      ```
      * -t 设置超时，超过指定的秒数read命令返回一个非0的状态码。
      ```bash
      if read -t 15 -p "请在15秒内输入验证码：" code
      then
        echo $code
      else
        echo "没有输入验证码"  
      fi  
      ```
      * -n 限定输入字符数，当输入字符满足设定时自动结束输入
        ```bash
        read -n1 -p "要继续吗？[Y/N]" answer
        case $answer in
          Y | y)
              echo
              echo "继续"  
              ;;         
          N | n)
              echo
              echo "结束"   
              exit 0
              ;;
        esac
        ```
        * -s 使输入的内容不回显，密码等不回显会更好些。
          ```bash
          read -s -p "请输入密码：" pass
          ```
    * read 可以有多个变量也可以没有变量
      * 没有变量的情况用户的所有输入将会被保存到REPLY环境变量中
      ```bash
      read -p "请输入姓名："  
      echo "name is $REPLY"
      ```
    * 通过管道读入输入
      ```bash
      count=1;
      cat test | while read line
      do
        echo "第$count行数据是： $line"
        count=$[ $count + 1 ]
      done  
      ``` 
    * 从文件中读入数据（重定向）   
      ```bash
      count=1
      while read line
      do
        echo "第$count行数据是： $line"
        count=$[ $count + 1 ]
      done < test.txt
      ```
## 呈现数据

### 重定向
  * 标准文件描述符
    * 每个进程一次最多可以有九个文件描述符。出于特殊目的,bash shell保留了前三个文件描述符( 0 、 1 和 2 ),
     *    0   STDIN     标准输入
     *    1   STDOUT  标准输出
     *    2   STDERR  标准错误
  * 重定向错误输出到文件
    * 在重定向符前加上错误文件描述符  
      * 只重定向错误 
      ```bash
      ls  not_exit_file  2> out.txt 
      ```
      * 即重定向错误又重定向数据（分不同的文件）
      ```bash
      ls  not_exit_file  exit_file  2> out_err.txt  1> out_ok.txt 
      ``` 
      ```bash
      ls  not_exit_file  exit_file  2> out_err.txt  > out_ok.txt 
      ``` 
      * 把标准错误STDERR与标准输出重定向到一个文件
        ```bash
        ls  not_exit_file  exit_file  &> out.txt 
        ```
#### 在脚本中重定向输出
  * 临时重定向
    ```bash
    echo  "这是错误消息 " >&2
    echo "这是正常输出信息"
    ``` 
    * 这个方法非常适合在脚本中生成错误消息。 
  * 永久重定向
    * 如果脚本中有大量数据需要重定向,那重定向每个 echo 语句就会很烦琐。取而代之,你可以用 exec 命令告诉shell在脚本执行期间重定向某个特定文件描述符。 
    ```bash
    #!/bin/bash
    # redirecting all output to a file
    exec 1>testout
    echo "This is a test of redirecting all output"
    echo "from a script to another file."
    echo "without having to redirect every individual line"
    ```
    ```bash
    #!/bin/bash
    # redirecting output to different locations
    exec 2>testerror
    echo "This is the start of the script"
    echo "now redirecting all output to another location"
    exec 1>testout
    echo "This output should go to the testout file"
    echo "but this should go to the testerror file" >&2    
    ```
#### 在脚本中重定向输入
  ```bash
    exec 0< testfile
    count=1
    7
    while read line
    do
    echo "Line #$count: $line"
    count=$[ $count + 1 ]
    done  
  ```    
### 创建临时文件 mktemp
  *   Linux使用/tmp目录来存放不需要永久保留的文件。大多数Linux发行版配置了系统在启动时自动删除/tmp目录的所有文件。
  * 系统上的任何用户账户都有权限在读写/tmp目录中的文件。这个特性为你提供了一种创建临时文件的简单方法,而且还不用操心清理工作。
  * 语法，模板可以包含任意文本文件名,在文件名末尾加上多个 X 就行了。mktemp会生成字符替换X
    * mktemp testing.XXXXXX
  * 例子  
  ```bash
  tempfile=$(mktemp test19.XXXXXX)
  echo "hello temp" > tempfile
  cat tempfile
  ```  
#### 在/tmp 目录创建临时文件
  * 使用 -t 选项强制 mktemp 命令来在系统的临时目录来创建临时文件
#### 创建临时目录
  * -d  ，  命令 mktemp 来创建一个临时目录而不是临时文件
### 同时将信息发送到显示器和文件 tee
  *   tee 命令相当于管道的一个T型接头。它将从 STDIN 过来的数据同时发往两处。一处是STDOUT ,另一处是 tee 命令行所指定的文件名:
  ```bash
  ls | tee ls.out
  ```
  * 使用 -a 参数 使 tee 追加文件
  ```bash
  ls | tee -a ls.out
  ```
## 控制脚本

### 处理信号
  *   Linux 信号
    *  1   SIGHUP    挂起进程
    *  2   SIGINT     终止进程    
    *  3   SIGQUIT   停止进程
    *  9   SIGKILL    无条件终止进程
    *  15 SIGTERM  尽可能终止进程
    *  17 SIGSTOP  无条件停止进程,但不是终止进程
    *  18 SIGTSTP   停止或暂停进程,但不终止进程
    *  19 SIGCONT  继续运行停止的进程
  * Ctrl+C组合键会生成 SIGINT 信号  
  * Ctrl+Z组合键会生成一个 SIGTSTP 信号
  * 默认情况下,bash shell会忽略收到的任何 SIGQUIT (3) 和 SIGTERM (5) 信号(正因为这样,交互式shell才不会被意外终止)。但是bash shell会处理收到的 SIGHUP (1) 和 SIGINT (2) 信号。
  * 捕获信号 trap
    ```text
    trap  commands  singnals
    ```
    * 在 trap 命令行上,你只要列出想要shell执行的命令,以及一组用空格分开的待捕获的信号。你可以用数值或Linux信号名来指定信号。
      ```bash
      #!/bin/bash
      # Testing signal trapping
      #
      trap "echo ' Sorry! I have trapped Ctrl-C'" SIGINT
      #
      echo This is a test script
      #
      count=1
      while [ $count -le 10 ]
      do
      echo "Loop #$count"
      sleep 1
      count=$[ $count + 1 ]
      done      
      ```
    * 捕获脚本退出
      ```bash
      #!/bin/bash
      # Trapping the script exit
      #
      trap "echo Goodbye..." EXIT
      #
      count=1
      while [ $count -le 5 ]
      do
      echo "Loop #$count"
      sleep 1
      count=$[ $count + 1 ]
      done      
      ```  
    * 删除已设置好的信号
      * trap -- SIGINT 
      * 也可以在 trap 命令后使用单破折号来恢复信号的默认行为。 
### 后台运行脚本
  * 只要在命令后加个 & 符就行了。  
    ```bash
    ./test.sh  &
    ```
  *   [1]   3231  ,方括号中的数字是shell分配给后台进程的作业号。下一个数是Linux系统分配给进程的进程ID(PID)。
  * 注意,当后台进程运行时,它仍然会使用终端显示器来显示 STDOUT 和 STDERR 消息。
### 在非控制台下运行脚本 nohup
  *   有时你会想在终端会话中启动shell脚本,然后让脚本一直以后台模式运行到结束,即使你退出了终端会话。这可以用 nohup 命令来实现。
  ```bash
  nohub ./test.sh &
  ```
  * 当你使用 nohup 命令时,如果关闭该会话,脚本会忽略终端会话发过来的 SIGHUP 信号。由于 nohup 命令会解除终端与进程的关联,进程也就不再同 STDOUT 和 STDERR 联系在一起。为了保存该命令产生的输出, nohup 命令会自动将 STDOUT 和 STDERR 的消息重定向到一个名为nohup.out的文件中。

### jobs 作业的控制
  * jobs 命令允许查看shell当前正在处理的作业。
    *  -l 列出进程的PID以及作业号
    *  -n 只列出上次shell发出的通知后改变了状态的作业
    *  -p 只列出作业的PID
    *  -r 只列出运行中的作业
    *  -s 只列出已停止的作业
  * 你可能注意到了 jobs 命令输出中的加号和减号。带加号的作业会被当做默认作业。在使用作业控制命令时,如果未在命令行指定任何作业号,该作业会被当成作业控制命令的操作对象。    
  * 当前的默认作业完成处理后,带减号的作业成为下一个默认作业。任何时候都只有一个带加号的作业和一个带减号的作业,不管shell中有多少个正在运行的作业。
#### 重启停止的作业
  * bg  + 作业号 ，后台模式重启
    ```bash
    bg 1
    ```
  * fg + 作业号 ，前台模式重启
    ```bash
    fg 1
    ```
### 调整谦让度
  * 调度优先级是个整数值,从-20(最高优先级)到+19(最低优先级)。默认情况下,bash shell以优先级0来启动所有进程。（  值越小获得CPU时间的机会越高。 ）      
  * nice 命令允许你设置命令启动时的调度优先级。要让命令以更低的优先级运行,只要用 nice的 -n 命令行来指定新的优先级级别。
  ```bash
  nice -n 10 ./test.sh &
  ps -p 7812  -o pid,ppid,ni,cmd
  ```
####  改变已运行进程的优先级 renice
  * 通过PID改变以运行进程的优先级
    * renice -n 10 -p 5055
  * 只能对属于你的进程执行 renice ;
  * 只能通过 renice 降低进程的优先级;
  * root用户可以通过 renice 来任意调整进程的优先级。    
### 定时任务 （at 命令和 cron 表）
  * 在预定的时间运行脚本
####   用 at 命令来计划执行作业
####   用 cron 命令来计划执行作业
  * anacron
## 函数
  * 格式
    ```bash
    function name {
      commands
    }
    ```
    ```bash
    name() {
      commands
    }
    ```
    ```bash
    function name() {
      commands
    }
    ```
  * 调用函数时直接使用函数名，不能加括号
  ```bash
  la() {
    ls -al
  }
  la
  ```  
### 返回值
  * bash shell会把函数当作一个小型脚本,运行结束时会返回一个退出状态码
  * 默认返回状态码的值是函数最后一行命令的执行状态码
  * 可以使用return 指定返回状态码（0 ～ 255）
  * 使用函数输出
    ```bash
    add() {
      echo $[ $1 + $2 ]
    }
    res=$( add 2 5 )
    ```
  * 在函数内使用局部变量
    * 声明变量前加 local 关键字
    ```bash
    fn1() {
      local as=2
    }
    ``` 
    * 没有使用local声明的变量都是全局变量
    * local 关键字只能用在函数内部。