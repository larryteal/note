# scp （secure copy）
## scp 远程文件拷贝，使用ssh保证传输安全性

## 命令格式
  * scp [-1246BCpqrv] [-c cipher] [-F ssh_config] [-i identity_file] [-l limit] [-o ssh_option] [-P port] [-S program] [[user@]host1:]file1 [...] [[user@]host2:]file2
  * 简易写法 scp [参数] [源路径] [目标路径]
    * 根据上传或拉取的不同 [源路经] 和 [目标路径] 可以是本地路径或远端路径
    * 远端路径写法 [user@]host:[path] （ 最简写法是 'host:' 冒号不能省略  ）
    * scp 也能进行本地拷贝，即 [源路径 和 [目标路径] 都是本地路径
    * 如果存在同名文件则默认覆盖
    * 上传 (推送)
  * 在目标路径中也可以指定文件名称，不指定的话与源文件名相同  
  ```bash
  scp ～/scp_test.txt  Larry@192.168.122.43:~/
  ```
  * 拉取 （下载）
  ```bash
  scp Larry@192.168.122.43:~/scp_test.txt  ./
  ```
  * 如果拉取或上传的是文件夹 要使用 -r 参数
  * 可选参数
    * -1  强制scp命令使用协议ssh1  
    * -2  强制scp命令使用协议ssh2  
    * -4  强制scp命令只使用IPv4寻址  
    * -6  强制scp命令只使用IPv6寻址  
    * -B  使用批处理模式（传输过程中不询问传输口令或短语）  
    * -C  允许压缩。（将-C标志传递给ssh，从而打开压缩功能）  
    * -p 保留原文件的修改时间，访问时间和访问权限。  
    * -q  不显示传输进度条。  
    * -r  递归复制整个目录。  
    * -v 详细方式显示输出。scp和ssh(1)会显示出整个过程的调试信息。这些信息用于调试连接，验证和配置问题。   
    * -c cipher  以cipher将数据传输进行加密，这个选项将直接传递给ssh。   
    * -F ssh_config  指定一个替代的ssh配置文件，此参数直接传递给ssh。  
    * -l limit  限定用户所能使用的带宽，以Kbit/s为单位。     
    * -o ssh_option  如果习惯于使用ssh_config(5)中的参数传递方式，   
    * -P port  注意是大写的P, port是指定数据传输用到的端口号   
    * -S program  指定加密传输时所使用的程序。此程序必须能够理解ssh(1)的选项。

## scp 不能很好的处理软链接和应链接，最好是使用tar打包后再用scp