# ssh-add
  * 要配合 ssh-agent 使用
## 使用及参数
  * ssh-add 清除已经添加的密钥
    * 删除ssh-agent中指定密钥，语法 ssh-add -d  private_key_path
      ```bash
      ssh-add -d ./ssh/id_rsa
      ```
    * 删除ssh-agent中所有密钥  ，语法 ssh-add -D
      ```bash
      ssh-add -D
      ``` 
  * ssh-add -l   列出已经加载的密钥的指纹
  * ssh-add -L  列出已经加载的密钥的公钥  
  * ssh-add -x  锁定代理（临时离开时的安全策略，降低风险）
  * ssh-add -X  解除锁定代理
  * ssh-add -t  20   指定时间（秒），超过时间自动清除密钥
    ```bash
    ssh-add -t 20 .ssh/id_rsa
    ```