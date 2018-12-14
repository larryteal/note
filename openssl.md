# openssl

## 安装
  ```bash
  yum install openssl
  ```
## 使用 openssl 生成公私钥
  * 执行 openssl 命令进入 openssl 命令行界面
  ```bash
  openssl
  ```
  * 生成 rsa 私钥
  ```bash
  OpenSSL> genrsa -out rsa_private_key.pem 1024
  ```  
  * 生成对应的公钥
  ```bash
  OpenSSL> rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem
  ```
  * 把RSA私钥转换成PKCS8格式
  ```bash
  OpenSSL> pkcs8 -topk8 -inform PEM -in rsa_private_key.pem -outform PEM -nocrypt
  ```
## 对比 ssh-keygen  