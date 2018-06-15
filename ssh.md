# ssh

## ssh 可以提供安全远程登陆、安全文件传输、访问控制、TCP/IP端口转发 等等

## sshd 是ssh的服务器端程序，只有启动sshd才能通过ssh客户端（ssh）连接远端计算机。
  * systemctl start sshd
  * systemctl status sshd
  * systemctl stop sshd
  * systemctl restart sshd
## 修改sshd的配置文件 /etc/ssh/sshd_config
  * 禁止 root 用户登陆 ，如下设置
    * PermitRootLogin no   
  * 通常为了安全也会修改端口号
  * 在配置好证书登陆后也可以禁止密码登陆  
## 使用密钥（证书）登陆
  * 生成公私钥对，生成的时候会提示 文件存放位置及名称，也会提示设置私钥密码，如果不需要直接 Enter 使用默认就行了。
  ```bash
  ssh-keygen -t rsa
  ```
  * 把公钥添加到远端计算机的 authorized_keys 文件中 （～/.ssh/authorized_keys）
    * 可以先把公钥上传到远程服务器然后追加到authorized_keys文件中（文件不存在的话可以手动创建,注意权限是600，chmod 600 authorized_keys ，authorized_keys 的父级目录 .ssh 权限是 700 ， chmod 700 -R .ssh ）
      ```bash
      cat  id_rsa  >> authorized_keys
      ```
    * 也可以使用 ssh-copy-id 命令工具远程添加
      ```bash
      ssh-copy-id  -i   id_rsa   Larry@192.168.122.43
      ```
  * 有些人会把私钥重命名成 xxxx.pem 的形式
  * 把公钥添加到远程主机的 authorized_keys 文件中后，拥有响应私钥的用户就能使用私钥进行登陆，而不再需要输入远程主机的密码。如果私钥没有设置密码就可以实现免密登陆。
  * 建议在生成密钥是为私钥设置密码。使用有密码的私钥时会提示输入私钥密码，注意不是远程主机的密码。
  * 使用私钥登陆远程主机( -i 参数用于指定私钥文件位置，如果在默认位置默认名称 ～/.ssh/id_rsa 则无需指定 )
    ```bash
    ssh -i id_rsa Larry@192.168.122.43
    ```
  * 私钥文件的权限不能太高 400 或 600，否则会提示无法使用
## 辅助工具
  * ssh-keygen
    * 生成公私钥文件
  * ssh-copy-id
    * 把公钥添加到远程主机上
    * https://www.ssh.com/ssh/copy-id
  * ssh-agent
    * 在不重启的情况下可以让有密码保护的私钥只输入一次私钥密码。
    * https://www.ssh.com/ssh/agent
    * ssh-add 
      * 把私钥缓存到 ssh-agent
      * 语法 ssh-add  private_key_path
        ```bash
        ssh-add  .ssh/id_rsa
        ```
      * https://www.ssh.com/ssh/add
    * ssh-agent 把解密后的私钥缓存在内存中
    * ssh 会自动跟ssh-agent 通信
    * ssh-agent 程序退出或者shell退出或者重启计算机后缓存的密钥消失 
    * e.g
    ```bash
    eval `ssh-agent`
    ssh-add .ssh/id_rsa
    ssh -i .ssh/id_rsa Larry@192.168.122.43
    ``` 
## 使用帐号密码登陆远程主机
  * ssh [username@]host
  * ssh -l username host
  * 如果省略了 [username@] 则表示远程机器的用户名和本机的用户名相同
  * eg
  ```bash
  ssh Larry@192.168.122.43
  ```
  ```bash
  ssh -l Larry 192.168.122.43
  ```  
##  其他
  * 中间人攻击出现在第一次连接且是密码连接
  * 使用 ssh  时可以使用 -v （verbose）参数显示一些详细信息
  * ssh 转义符，远程连接成功后 输入 ～? 可以查看支持的转义符
  * ssh 对文件和目录的权限要求十分严格，（取消其他用户的写权限）
  * 在配置好密钥连接后，取消密码连接可以提高安全性。
  * 启动ssh-agent 的两种方法( 默认ssh-agent 应该是未启动的 )
    ```bash
    eval `ssh-agent`
    ```
    ```bash
    ssh-agent $SHELL
    ```
  
  * ssh-agent 带来了方便，同时也带来了风险，暂时不适用终端又不关闭终端的情况下记得清除密钥缓存，或者锁定终端。因为当密钥被缓存后任何人都可以通过终端进行远程登陆而不需要密码，更甚者，入侵者可以从代理缓存中提取密钥！！
  * ssh-agent 代理的其他用途
    * 假设有一个自动处理的脚本其中用到了ssh进行远程操作，如果不使用代理的话，脚本就会提示输入口令，这不便于自动操作。如果使用了代理就可以不用输入口令而运行了。
    * ssh-agent 辅助scp 实现 从一个远程主机拷贝文件到另一个远程主机 
      * 本地A，远程B、远程C 
      * 在A机器上操作,复制B机器上的 ～/a.txt 文件复制到 C 机器上 的～/目录下
        ```bash
        scp  b1@192.168.122.43:~/a.txt  c1@192.168.122.39:~/
        ```
      * （备注: 测试中没能实现不输密码的效果，提示输入B到C的私钥密码，应该时ssh-agent 的配置问题，多个没能共享ssh-agent）  
  * slogin 是 ssh 的别名    

## 客户端配置文件 /etc/ssh/ssh_config
  * 增加一个Host
    ```text
    Host  a_name
        HostName    192.168.122.43
    ```
  * 保存更改后可以使用下面的方式登陆
    ```bash
    ssh a_name
    ```  
  * 其中Host 后面的 a_name 是自定义的名称， HostName 后面是目标主机（可以是ip或域名）  

  * /etc/ssh/ssh_config 的配置文件是全局的，针对所有用户，如果只是当前用户可以在 ～/.ssh/config 中配置，如果不存在 config 文件可以自己创建，注意权限不能太高（644）
## 配置优先级
  * 1、命令行选项
  * 2、用户本地配置文件
  * 3、用户全局配置文件  

## ssh 用户名
  * 指定用户名登陆 ssh  username@host
    ```bash
    ssh Larry@192.168.122.43
    ```
  * 本地登陆的用户名与远程要登陆的主机的用户名同名时，省略用户名
    ```bash
    ssh 192.168.122.43
    ```
  * 本地用户名与远端用名不一致时在配置文件中指定用户名，之后就不用每次都指定用户名了
    * /etc/ssh/ssh_config  或者  ～/.ssh/config
      ```text
      Host *
          User    Herry
      ```
      ```text
      Host    custom_name
          HostName  192.168.122.43
          User    Herry
      ```
    * 使用
      ```bash
      ssh 192.168.122.43
      ```  
      ```bash
      ssh custom_name
      ```  

  