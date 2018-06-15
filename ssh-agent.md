# ssh-agent

## 不要想当然的直接使用 ssh-agent 密令
  ```bash
  ssh-agent
  ```  
  * 尽管这样代理也可以运行，但是SSH客户端无法与其联系，如果环境变量设置的不正确，即使终止命令（ eval `ssh-agent -k` ）也无法将其清除
  * 如果直接使用 ssh-agent 命令，会启动一个无用的ssh-agent，并输出如下内容
    ```text
    SSH_AUTH_SOCK=/tmp/ssh-cdU4r9KSCPT9/agent.13935; export SSH_AUTH_SOCK;
    SSH_AGENT_PID=13936; export SSH_AGENT_PID;
    echo Agent pid 13936;
    ```
  * 多次执行会启动多个ssh-agent进程，无法使用 eval `ssh-agent -k` 将其关闭，使用 kill pid
    ```bash
    kill 13936
    ```    


## 单 shell 方式
  * 使用单 shell 方式就是就是在当前登陆的shell中运行代理。
    ```bash
    eval `ssh-agent`
    ```
  * 这样可以在后台运行一个ssh-agent进程。 注意使用的是``(反引号)而不是''（单引号）
  * 手动结束ssh-agent 代理
    * 结束进程
    ```bash
    kill 24563
    ```
    * 清除环境变量
    ```bash
    unset SSH_AUTH_SOCK
    unset SSH_AGENT_PID
    ```
  * 使用命令结束代理
    ```bash
    eval `ssh-agent -k`
    ```  
    * eval `ssh-agent -k` 会结束ssh-agent 进程并清相关除环境变量
  * 重复执行 eval `ssh-agent` 命令会启动多个ssh-agent ,而环境变量会覆盖
## 子 shell  方式
  * 可以为ssh-agent 提供一个参数，参数是一个shell 或者shell 脚本的路径
    ```bash
    ssh-agent /bin/bash
    ssh-agent $SHELL
    ssh-agent /bin/csh
    ssh-agent  my-shell-script
    ```
  * 注意，如果先在shell中运行了一些后台程序，然后又调用了代理（如： ssh-agent $SHELL ）,那么最初那些后台程序只有在结束代理子shell之后才可以访问。例如运行了vi，又挂起了vi，那么在代理子shell中无法看到挂起的vi。
    ```text  
    vi myfile    // 启动vi
    ^z            // 挂起 vi
    jobs        // 查看后台程序
    [1]  + Stop[ed ()  vi
    ssh-agent  $SHELL       // 启动代理子shell
    jobs                            // 这里看不到 挂起的vi，他在父shell中
    exit                             // 退出子shell
    jobs                            // 推出后可以看到挂起的 vi 进程了。
    [1]  + Stop[ed ()  vi