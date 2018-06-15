# ssh-keygen 

## ssh-keygen 用于生成公私钥对，ssh 远程登陆，git 代码管理等都要用到
  * 基本用法
  ```bash
  ssh-keygen
  ```
  * 可选参数
    * -t 指定算法 rsa | dsa | ecdsa | ed25519 （ 默认是rsa）
    ```bash
     ssh-keygen -t rsa
    ```
    * -b 指定密钥位数 1024 | 2048 | 4096
    ```bash
    ssh-keygen -t rsa -b 4096
    ```
    * -f 指定文件位置及名称
    ```bash
    ssh-keygen -t rsa -b 4096 -f ./id_rsa_4096
    ```
    * -C 添加注释（注释内容会添加到公钥文件的末尾，默认注释是  用户名@主机名 ）
    ```bash
    ssh-keygen -C '注释内容。。。'
    ```
    * -N  passphrase  ,指定生成的私钥的口令，如果不提供的话生成的过程中会提示设置(不推荐使用，明文设置的口令可以被看到)
    ```bash
    ssh-keygen -N 123456
    ```
    * -p 修改私钥口令， （ -p -f 私钥文件 -P 旧的密钥口令 -N 新的密钥口令）
    ```bash
    ssh-keygen -p -f ./id_rsa -P 123456 -N 123456789
    ```
    

## 文档
  * https://www.ssh.com/ssh/keygen/    

