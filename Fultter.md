# Google Fullter 
## 官方建议 最新 beta 版 （2018.7.6）
  * git clone -b beta https://github.com/flutter/flutter.git
## 下载之后的环境变量及资源镜像设置
  * 编辑 ～/.bash_profile 文件
    ```text
    export PUB_HOSTED_URL=https://pub.flutter-io.cn
    export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
    export PATH="$PATH:$your_flutter_home/flutter/bin"
    ```
  * 后续操作
    ```bash
    source  ~/.bash_profile  
    flutter doctor -v
    ```  
  * flutter doctor -v 检查开发环境，（并不准确 2018.7.7）
  