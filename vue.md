# Vue 2.x

## 不同版本的 npm node 引起的错误
  * 问题: vue-element-admin 项目使用 6.x 的 node 安装node_modules 后切换node 到 8.x 执行 npm run dev 编译报错, 删除 node_modules 后重新 npm install 无法重新安装 node_modules
  * 解决: 删除 node_modules 和 package-lock.json 后再重装 ok!  