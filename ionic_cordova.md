# centos 7, ionic cordova build android

## 问题
### 没有 JAVA_HOME 环境变量
  * 在～/.bash_profile 中增加 JAVA_HOME 的环境变量
  * 更新设置
    ```bash
    source ~/.bash_profile
    ```
### 没有 ANDROID_HOME 环境变量
  *  在～/.bash_profile 中增加 ANDROID_HOME 的环境变量
  * 同时要把android的相关工具目录加到PATH环境变量
    ```bash
      PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
      export PATH
    ```
  * 更新设置
    ```bash
    source ~/.bash_profile
    ```  
## 删除 centos 7 默认安装的open-jdk
  * 命令如下
    ```bash
    sudo yum remove java-*
    ```

### JDK 版本不对
  * 1 jdk 版本问题（cordova 官网指定v1.8，2018.7.6）
  ```text
  JAVA_HOME=/usr/java/jdk-10.0.1
  (node:32502) UnhandledPromiseRejectionWarning: Unhandled promise rejection (rejection id: 1): Requirements check failed for JDK 1.8 or greater
  ```
  * 安装 1.8 后使用重新设置后仍上面的报错（按如下步骤排除错误）
    * 确保java 版本正确 1.8....
    * 确保javac 版本也是 1.8... (我用 alternative 管理的出现了java是1.8，javac是10)
    * 确保JAVA_HOME环境变量是1.8的
### Gradle 和  Android Studio 的问题
  * 提示信息
  ```text
  Could not find an installed version of Gradle either in Android Studio,or on your system to install the gradle wrapper. Please include gradle in your path, or install Android Studio
  ```     
  * android-studio 内带有 Gradle 工具，只是要把他加到环境变量PATH中，否则无法找到可执行文件位置
### Error: spawn EACCES
  * 原因是 gradle 没有可执行权限（找到可执行文件gradle的位置然后增加可执行权限）
    ```bash
    chmod 755 gradle
    ```

## 来自网络
  * 检查配置，可以列出已经正确配置和不符合要求的配置项
    ```bash
    cordova requirements android --verbose  
    ```
  * 命令执行后的提示信息  
    ```text
      Requirements check results for android:
      Java JDK: installed 1.8.0
      Android SDK: installed true
      Android target: not installed 
      Please install Android target / API level: "android-26".

      Hint: Open the SDK manager by running: /home/Larry/Android/Sdk/tools/android
      You will require:
      1. "SDK Platform" for API level android-26
      2. "Android SDK Platform-tools (latest)
      3. "Android SDK Build-tools" (latest)
      Gradle: not installed 
      Could not find an installed version of Gradle either in Android Studio,
      or on your system to install the gradle wrapper. Please include gradle 
      in your path, or install Android Studio

      Requirements check results for ios:
      Apple macOS: not installed 
      Cordova tooling for iOS requires Apple macOS
      (node:11755) UnhandledPromiseRejectionWarning: Unhandled promise rejection (rejection id: 1): Some of requirements check failed
    ```
  * 指定android 版本
    ```bash
    cordova platform add android@6.2.1 --save
    ```  
  * 使用 android 命令查看一些信息
    ```bash
    android
    ```  
    * 列出当前安装的 sdk platform API 版本 （即 Android target，目前2018.7.6 需要 android-26 ）
      ```bash
      android list target
      ```
## sdkmanager 使用
  * 
###  错误 Warning: File ～/.android/repositories.cfg could not be loaded.
  * ～/.android/repositories.cfg 文件不存在
  * 在相应位置新建一个空的 repositories.cfg 文件
    ```bash
    touch repositories.cfg
    ```
