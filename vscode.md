# vscode使用
## 插件
* Atom 快捷键
  Atom Keymap
* 路径自动补全
  Path Intellisense
## markdown 预览
  ctrl + shift + v
## VSCode使用ESLint检查Vue代码
  * 【文件】-【首选项】-【配置】，增加以下设置
  ```text
    "eslint.validate": [
      "javascript",
      "javascriptreact",
      "html"
    ],
    "files.associations": {
      "*.vue": "html"
    }
  ```