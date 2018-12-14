# Git

## clone 指定分支 (  -b )
  * git clone -b beta https://github.com/flutter/flutter.git

## 更换git远端仓库地址
  * git remote -v
  * git remote rm origin
  * git remote add origin git@rep.360taihe.com:trbh/opr.git
## Tag 使用
  * 新建 tag
  ```bash
  git tag -a <Tag名字>
  ```
  * 新建 tag 指定 commit ID
  ```bash
  git tag <Tag 名字> <SHA-1 Code>
  ```
  * 创建带注释的 tag
  ```bash
  git tag -a <Tag名字> -m <注释文字> <SHA-1 Code>
  ```
  * 查看 tag
  ```bash
  git tag
  ```
  * 查看指定Tag的详细信息
  ```bash
  git show <Tag 名字>
  ```
  * 删除 tag
  ```bash
  git tag -d <Tag 名字>
  ```
  * 推送Tag到远程
  ```bash
  git push origin <Tag 名字>
  ```
  * 通过 --tags 参数来推送所有本地新的Tag
  ```bash
  git push origin --tags
  ```
  * 删除远程Tag
  ```bash
  git tag -d <Tag 名字>
  git push origin :refs/tags/<Tag 名字>
  ```
