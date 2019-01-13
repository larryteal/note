# vscode使用
## 插件
* Atom 快捷键
  * Atom Keymap
* 路径自动补全
  Path Intellisense
* EditorConfig for VS Code
* gitignore
* language-stylus
* Nunjucks  
* One Dark Pro
* View In Browser

  * Path Intellisense
* 修改html标签，自动完成尾部闭合标签的同步修改
  * Auto Rename Tag  
* region folding for VS Code 创建折叠代码块   
## markdown 预览
  ctrl + shift + v
## VSCode使用ESLint检查Vue代码
  * 方法一、 【文件】-【首选项】-【配置】，增加以下设置
  ```
    "eslint.validate": [
      "javascript",
      "javascriptreact",
      "html"
    ],
    "files.associations": {
      "*.vue": "html"
    }
  ```
  * 方法二（推荐）【文件】-【首选项】-【配置】，增加以下设置
  ```
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "vue"
  ]
  ```
## VScode 添加vue代码片段
  * 找到 User Snippets 【文件】-【首选项】 - 用户代码片段
  * 在上一步操作后提示的选项中选择 vue.json
  * 配置自己的代码片段
  ```
  "init vue page": {
		"prefix": "vue",
		"body": [
			"<template>",
			"\t<div>",
			"\t\t$0",
			"\t</div>",
			"</template>",
			"<script>",
			"export default {",
			"\tname: '${1:name}',",
			"\tdata () {",
			"\t},",
			"\tmethods: {",
			"\t}",
			"}",
			"</script>",
			"<style lang=\"${2:scss}\" ${3:scoped}>",
			"</style>",
			""
		],
		"description": "init vue page"
	}
  ```
  <!-- TODO -->
## 代码折叠 fold
  * ctrl + k  然后 ctrl + [ 
  * ctrl + k  然后 ctrl + ] 
  * ctrl + k  然后 ctrl + 0 ~ 9
  * ctrl + k  然后 ctrl + /
