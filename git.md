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

## git 补充几个命令
  * git log --oneline --graph --decorate --all
    * --decorate 可以显示出tags以及HEAD所指向的分支
  * git checkout -b branchname tag
    * 在特定的标签上创建一个新分支
  * git add . -p
    * -p 参数显示修改的内容
  * git commit --amend -m '新的commit 备注'  
    * 修改上次commit备注
  * git mv a1.txt a2.txt
    * 重命名
  * git diff --cached  a1.txt
    * 查看暂存区里的变化
  * git status -s
    * 简化显示内容
  * git merge branchName --no-ff -m '合并备注'
    * 不使用默认的快速合并
  * git merge --abort
    * 摒弃冲突内容
  * git commit -a -m 'commit 备注'
    * 快速提交省去了add操作
  * git diff branch1 branch2
    * 对比分支的不同  
  * git ls-remote
    * 列出远程信息（网络请求）
  * git remote show 
  * git branch -a
    * 列出所有分支
  * git branch -r
    * 列出本地存在的远程分支（fetch已经拉去过的）
  * git fetch origin master:temp
    * //在本地新建一个temp分支，并将远程origin仓库的master分支代码下载到本地temp分支
    * git diff temp
    * git merge temp
    * git branch -d temp
  * git fetch
    * 不加参数会拉去所有的远程分支数据
    * git merge FETCH_HEAD
      * 合并 FETCH_HEAD 指向的分支到当前分支
    * git merge origin/master
      * 合并 origin/master 指向的分支到当前分支
    * git merge origin/test
      * 合并 origin/test 指向的分支到当前分支
    * git checkout -b test origin/test
      * 建立本地分支 test 依照远程分支 origin/test
      * git checkout --track origin/test
        * 上述简写
    * git push  origin --delete test
      * 删除远程分支 test
    * git diff --check
      * 检查尾随的空格    
      * git diff --cached --no-color > stage.diff && git apply --index -R stage.diff && git apply --index --whitespace=fix stage.diff && rm -f stage.diff
        * git 去除空格