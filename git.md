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
## git 分支
  * git init 初始化
  * git remote -v 查看远程仓库地址
  * git push origin master  初次提交会创建 master 分支
  * git checkout -b dev 在创建分支上创建dev分支
  * git push origin dev 把本地dev分支推送到远端
  * git branch -a 列出所有的分支信息
  * git checkout master 切换到主分支
  * git merge dev 在当前分支合并dev分支（有冲突本地解决冲突后， git add 、 commit 、 push）
  * git branch -D dev 删除本地dev分支
  * git push origin :dev 删除远端dev分支
  * git reset --hard head^ 回退到上一次commit ^ 的个数表示回退几个
  * git log 查看日志
  * git reflog 查看日志
  * git reset --hard 788fsf 回退到指定状态 788fsf 是 git reflog 中查看到的记录标识

