# 远程登陆服务器
## 曾经 使用 ssh ip 然后输入用户密码远程登陆
## 使用证书登陆
```bash
ssh -p 22 node@116.62.123.117  -i  证书.pem
```
### 证书应该具有所有者只读权限 0400，否则无法使用（WARNING: UNPROTECTED PRIVATE KEY FILE!）
```bash
chmod 0400 证书.pem
```
