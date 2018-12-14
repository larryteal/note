# nvm 
## nvm ls-remote 返回 N/A
  * 原因: ssl 证书过期等问题
  * 解决1: 使用非https内容镜像
  ```bash
  export NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist
  ```