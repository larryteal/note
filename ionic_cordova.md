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
# ionic components
## Action Sheets 操作表
  * 功能描述: 从屏幕底部向上滑动弹出操作表.并显示一组可以确认或取消的操作选项.
  * 当显示操作表时,其他部分变暗,操作表作为活动焦点.只有操作表隐退后其他内容才可以操作.
  * 相关服务 ActionSheetController
  ```
  Import { ActionSheetController } from 'ionic-angular'

  export class MyClass {
    constructor(
      public actionSheetCtrl: ActionSheetController //依赖注入
    ){}
    presentActionSheet(){
      let actionSheet = this.actionSheetCtrl.create({
        title:'标题',
        subTitle:'子标题',
        cssClass:'自定义样式类',
        enableBackdropDismiss: true,//true/false 点击背景是否隐退操作列表,默认是  true  隐退
        buttons: [{ //可以操作的选项
          text:'操作项显示的文本内容',
          icon:'star',// 图标
          cssClass:'样式类',
          role:'cancel',// cancel/destructive IOS系统会增强显示样式
          handler: ()=>{
            // 处理程序
            actionSheet.dismiss();//隐退操作列表
            //再不调用 actionSheet.dismiss()方法的情况下,处理程序
            //返回true 则隐退操作列表,返回false 则不隐退操作列表
            // 默认情况下隐退操作列表
          }
        }]
      });
    }
  }
  ```
## Alerts 
  * 功能描述: 弹出框,
    * 普通提示信息弹出框
    * 确认信息弹出框
    * 带有单选选项的弹出框
    * 带有多选选项的弹出框
  * 依赖 AlertController 
  * 实例对象相关方法,present,dismiss,setTitle,setSubTitle,setMessage,setCssClass,addInput,addButton
  * 弹出框对象可选项: title,subTitle,inputs,buttons,enableBackdropDismiss,message,cssClass
  * inputs 可选项,type,name,label,value,placeholder,checked,id
  * buttons 可选项, text,cssClass,handler,role(null/cancel) 
    * 按钮处理函数返回false时弹出框不会自动隐退,要调用手动调用隐退方法(alert.dismiss)
  * 默认点击背景处自动隐退弹出框,在隐退时如果有按钮设置了role值为cancel则调用其对应的handler处理函数,没有role值时什么也不做.  

## Badges 徽章
  * 功能描述: 以徽章形式显示文字数字.
  * 简单组件, <ion-badge color="secondary">200k</ion-badge>
  * color 属性可以指定badge的颜色
  * 例子:
  ```
  <ion-item>
    <ion-icon nam="logo-twitter" item-start></ion-icon>
    Followers
    <ion-badge color="secondary" item-end><ion-badge>
  </ion-item>
  ```
## Buttons 按钮
  * 按钮组件,使用原生button标签,ion-button属性进行增强.
  * color 属性指定颜色样式
  * outline 属性指定使用外边框样式
  * clear 属性指定简洁样式(只显示按钮文字,没有背景,没有边框)) 
  * default 属性指定使用默认样式
  * round 属性指定圆角样式(左右边显示成了圆弧状))
  * block 属性指定按钮宽度占满整个父组件 (宽度100%)
  * full 属性同block类似,不同的是在宽度100%的同时去除了左右边框
  * 指定按钮大小,small ,lagre,默认是中等
  * solid 属性指定使用实体样式
  * strong 属性增强显示,字体会加粗
  
  * 带有图标的按钮
    * icon-start 指定图标显示在开头
    * icon-end 指定图标显示在末尾
    * icon-only 指定按钮只有图标
    * 使用时要按钮文字和图标和指定的属性保持一致,指定 icon-start 属性就要先写 ion-icon 组件再先按钮中要显示的文字
    ```
    <button icon-start>
      <ion-icon name="home"></ion-icon>
      Home
    </button>
    ```
    * 可以使用属性绑定的方式绑定属性
    * 有 click 事件


## Cards
  * 功能描述: 一个卡片样式的组件
  * 结构
  ```
  <ion-card>
    <ion-card-header></ion-card-header>
    <img src="#">
    <ion-card-content>
      <ion-card-title></ion-card-title>
      <p><p>
    </ion-card-content>
    <ion-list>
      <button ion-item>bulabula</button>
      <button ion-item>bulabula</button>
    </ion-list>
    <ion-item>
      <ion-icon name="" item-start large></ion-icon>
      <h2>ssss</h2>
      <p></p>
    </ion-item>
    <ion-row>
      <ion-col>
        <button ion-button clear small icon-start>
          <ion-icon name="thumbs-up"></ion-icon>
          <div>13k likes</div>
        </button>
      </ion-col>
      <ion-col>
        <button ion-button clear small icon-start>
          <ion-icon name="share"></ion-icon>
          <div>share</div>
        </button>
      </ion-col>
      <ion-col center text-center>
        <ion-note>
          11h ago
        </ion-note>
    </ion-col>
    </ion-row>
  </ion-card>
  ```
## Checkbox
  * 功能描述: 简单复宣框组件(<ion-checkbox></ion-checkbox>),不同于HTML checkbox标签
  * 属性: checked(设置为选中状态), disabled (设置为禁用状态),color
  * 事件: ionChange
  * 用法:
  ```
  <ion-checkbox></ion-checkbox>
  -------------------------------------------
  <ion-item>
    <ion-label>文字说明</ion-label>
    <ion-checkbox checked disabled></ion-checkbox>
  </ion-item>
  ----------------------------------
  <ion-checkbox [(ngModel)]="name" (ionChange)="onNameChange()"></ion-checkbox>
  ```

## DateTime
  * 功能描述: 时间日期组件(<ion-datetime></ion-datetime>)
  * 组件的值是string类型,且使用的是 ISO 8601 日期格式( YYYY-MM-DDTHH:mm+/-hh:mm ,new Date().toISOString() )
  * 重要属性 displayFormat , pickerFormat ,min ,max (详细信息参考 文档)
  * 时用
  ```
  <ion-datetime displayFormat="YYYY-MM-DD" pickerFormat="YYYY MM DD" [(ngModel)]="startDate" (ionChange)="startDateChange()">
  ```
  * 需要处理时区
    * 时用 moment
    ```
    npm install moment --save
    import * as moment from 'moment';
    let now = moment().format();
    ```
    * 修改 Date.prototype.toISOString 方法
    ```
    Date.prototype.toISOString = function () {
      var tzo = -this.getTimezoneOffset(),
        dif = tzo >= 0 ? '+' : '-',
        pad = function (num) {
          var norm = Math.floor(Math.abs(num));
          return (norm < 10 ? '0' : '') + norm;
        };
      console.log(tzo);

      return this.getFullYear() +
        '-' + pad(this.getMonth() + 1) +
        '-' + pad(this.getDate()) +
        'T' + pad(this.getHours()) +
        ':' + pad(this.getMinutes()) +
        ':' + pad(this.getSeconds()) +
        dif + pad(tzo / 60) +
        ':' + pad(tzo % 60);
        
    }    
    ```

## FABs (Floating Action Buttons)
  * 功能描述: 圆形按钮(可以包含子按钮),相对父组件固定位置绝对定位,其他行为同button
  * 组件: ion-fab
    * 子组件: button,需要使用 ion-fab 进行增强
  * 属性: mini(显示为i较小的样式)
    * 位置属性: top,bottom,left,right,center,middle
    * ion-fab-list 子组件有一个side的属性用于指定按钮弹出的方向: left,right,top,bottom
  * 使用: 
  ```
  <ion-fab top >
    <button ion-fab><ion-icon name="add"></ion-icon></button>
  </ion-fab>
  -------------------------
  <ion-fab>
    <button ion-fab><ion-icon name="share"></ion-icon></button>
    <ion-fab-list side="top">
      <button ion-fab><ion-icon name="logo-facebook"><ion-icon></button>
      <button ion-fab><ion-icon name="logo-twitter"><ion-icon></button>
      <button ion-fab><ion-icon name="logo-googleplus"><ion-icon></button>
    </ion-fab-list>
  </ion-fab>
  -------------------------------------------
  <ion-fab>
    <button ion-fab><ion-icon name="share"></ion-icon></button>
    <ion-fab-list side="top">
      <button ion-fab><ion-icon name="logo-facebook"><ion-icon></button>
    </ion-fab-list>
    <ion-fab-list side="left">
      <button ion-fab><ion-icon name="logo-twitter"><ion-icon></button>
    </ion-fab-list>
    <ion-fab-list side="right">
      <button ion-fab><ion-icon name="logo-googleplus"><ion-icon></button>
    </ion-fab-list>
  </ion-fab>
  ```

## Gestures 手势
  * 手势事件: tap (点),press (按),pan (平移), swipe (滑动), rotate (旋转), pinch (捏合)
  * rotate 和 pinch 事件需要单独处理

## Grid 网格系统
  * 功能描述: 网格布局组件
  * 结构: 
    ```
    <ion-grid>
      <ion-row>
        <ion-col></ion-col>
      </ion-row>
    </ion-grid>
    ```
  * 列 相关属性
    * col-*
    * col-xs-*,col-sm-*,col-md-*,col-lg-*,col-xl-*
    * col-auto,col-sm-auto ...
    * 组合 col-sm 与 col-*
      ```
      <ion-col col-12 col-sm></ion-col>
      ```
    * offset-*
    * offset-md-* ...
    * push-*
    * push-md-* ...
    * pull-*  
    * pull-md-* ...
    * align-self-start
    * align-self-center
    * align-self-end
    * 行相关属性,
      * 指定垂直方向的列对齐方式
        * align-item-start
        * align-item-center
        * align-item-end
      * 水平方向列对齐方式
        * justify-content-start  
        * justify-content-center  
        * justify-content-end  
        * justify-content-around  
        * justify-content-between  

## icon 字体图标
  * 功能描述: 字体图标组件
  * 属性: 
    * isActive 默认为true(实心) ,false 空心
    * name 指定字体图标的名称
    * ios
    * md
  * 使用:
    ```
    <ion-icon name="heart" isActive="false" color="danger"></ion-icon>
    ```
## Inputs 
  * 功能描述: 表单输入框
  * 组件: <ion-input></ion-inout> ;<ion-textarea rows="5"></ion-textarea>
  * 相关属性: type,value,plcaeholder,min,max,autocomplete,autocorrect,clearInput,clearOnEdit,readonly,step
  * 通常与 ion-label 配合使用
    * ion-label 属性: fixed,floating,stacked
  * 常用结构
    ```
    <ion-list>
      <ion-item>
        <ion-leabel>字段名称<ion-label>
        <ion-input type="text" placeholder="name"></ion-input>
      </ion-item>
    </ion-list>
    ```  
  * ion-list 也可以使用 inset 属性,来改变显示样式,默认每个输入项都是 100% 的宽度.
    ```
      <ion-list inset>
        <ion-item>
          <ion-leabel>字段名称<ion-label>
          <ion-input type="text" placeholder="name"></ion-input>
        </ion-item>
      </ion-list>  
    ```  

## Lists
  * 功能描述: 列表组件
  * 标签: ion-list, ion-group
  * 属性: inset,no-lines
  * 常用结构    
    * 基本用法
    ```
    <ion-list>
      <button ion-item>BTN1</buton>
      <button ion-item>BTN2</buton>
      <button ion-item>BTN3</buton>
    </ion-list>
    -----------------------------
    <ion-list>
      <ion-item>HHHH1</ion-item>
      <ion-item>HHHH2</ion-item>
      <ion-item>HHHH3</ion-item>
    </ion-list>
    // <button ion-item> 右侧会自动加一个箭头
    ```
    * 带有分隔的列表
    ```
    <ion-group>
      <ion-item-divider color="right">A类</ion-item-divider>
      <ion-item>A1</ion-item>
      <ion-item>A2</ion-item>
      <ion-item>A3</ion-item>
    </ion-group>
    ```
    * 带有头部的列表
    ```
    <ion-list>
      <ion-list-header>
        头部
      </ion-list-header>
      <ion-item>A1</ion-item>
      <ion-item>A2</ion-item>
      <ion-item>A3</ion-item>
    </ion-list>
    ```
    * 
    带有字体图标的列表
    ```
    <ion-list>
      <ion-item>
        <ion-icon name="leaf" item-start></ion-icon>
        HHH
        <ion-icon name="rose" item-end></ion-icon>
      </ion-item>
      <ion-item>
        <ion-icon name="leaf" item-start></ion-icon>
        <ion-label>HHHd</ion-label>
        <ion-icon name="rose" item-end></ion-icon>
      </ion-item>
      <ion-item>
        <ion-icon name="leaf" item-start></ion-icon>
        hhee
        <ion-note item-end>HHHd</ion-note>
      </ion-item>
      <ion-item>
        <ion-icon name="rose"></ion-icon>
        <ion-label>HHH</ion-label>
        <ion-toggle checked="false"><ion-toggle>
      </ion-item>
    </ion-list>
    ```
    * 带有头像的列表
    ```
    <ion-list>
      <ion-item>
        <ion-avatar item-start>
          <img src="#">
        </ion-avatar>
        <h2>dddd</h2>
        <p>ddddff</p>
      </ion-item>
    </ion-list>
    ------------------------------------
    <ion-list>
      <ion-item>
        <ion-avatar item-start>
          <img src="#">
        </ion-avatar>
        <h2>dddd</h2>
        <h2>dddd</h2>
        <h2>dddd</h2>
        <h2>dddd</h2>
        <p>ddddff</p>
        <p>ddddff</p>
        <p>ddddff</p>
        <p>ddddff</p>
      </ion-item>
    </ion-list>
    ```
    * 列表项可以左右滑动的列表
    ```
    <ion-list>
      <ion-item-sliding>
        <ion-item>
          <ion-avatar item-start>
            <img src="#">
          </ion-avatar>
          <h2>ddd</h2>
          <p>dpdpdf</p>
        </ion-item>
        <ion-item-options side="left">
          <button ion-button color="primary">
            <ion-icon name="text"></ion-icon>
            Text
          </button>
          <button ion-button color="secondary">
            <ion-icon name="call"></ion-icon>
            Call
          </button>
        </ion-item-options>
        <ion-item-options side="right">
          <button ion-button>
            <ion-icon name="mail">
            </ion-icon>
            Email
          </button>
        </ion-item-options>
      </ion-item-sliding>
    </ion-list>
    ```
    * 含有缩略图的列表
    ```
    <ion-list>
      <ion-item>
        <ion-thumbnail item-start>
          <img src="#">
        <ion-thumbnail>
        <h2>dddd</h2>
        <p>opfffd</p>
        <button ion-button item-end clear>View</button>
      </ion-item>
    <ion-list>
    ```
## Loading 
  * 功能描述: 加载页面时的提示框
  * 服务依赖: LoadingController
  * 使用
    ```
    constructor(public loadingCtrl: LoadingController) {
      loadingCtrl.create({
        spinner: '',//加载动画,hide,ios,dots,bubbles,circles,crescent
        content: '',//文本,或 html
        duration: 3000,//持续时间
        dismissOnPageChange: true,//页面变化时是否隐退,默认是false
        showBackdrop: true,//显示背景内容
        enableBackdropDismiss: false,//是否允许点击背景隐退
      });
    }
    ```
    * 相关组件
      * ion-spinner ,其name 属性与 spinner选项相对应
      ```
      <ion-list>
        <button ion-item>
          <ion-spinner name="dots"></ion-spinner>
          Show Dots
        </button>
      </ion-list>
      ```


## Menus
  * 功能描述 : 侧边菜单栏
  * 组件 : ion-menu
  * 主要属性: 
    * side: left / right
    * content
    * type: push / overlay / reveal
    * enabled : true / false
    * persistent : true / false
    * swipeEnabled : true / false
  * 相关服务: MenuController
    * 相关方法: open , close ,toggle
  * 使用: 
    * 一般写在 src/app/app.html
    * 使用时要与兄弟组件 ion-nav 一起使用
    * ion-nav 组件要设置模板本地变量,且 ion-menu 的 content 属性设置为其变量值
    ```
    <ion-menu [content]="mycontent">
      <ion-content>
        <ion-list>
          <button ion-item>men1</button>
          <button ion-item>men2</button>
        </ion-list>
      </ion-content>
    </ion-menu>
    <ion-nav #mycontent [root]="rootPage"></ion-nav>
    ```
    * 在其他页面可以添加按钮并绑定设置 menuToggle 指令,可以显示或隐退菜单栏
    * 按钮添加 menuClose 指令来关闭菜单栏,此指令一般添加再 ion-menu 组件内的button.
    ```
    <button ion-button menuToggle>
      <ion-icon name="menu"></ion-icon>
    </button>
    --------------------------
    <button ion-button [menuToggle]="activeMenu">
      <ion-icon name="menu"></ion-icon>
    </button>
    ```
    ```
    <button ion-item menuClose>
      关闭菜单
    </button>
    ```

## Modals
  * 功能描述: 弹出页面
  * 相关服务: ModalController,NavParams,ViewController
    * 服务不需要额外声明
  * ModalController 实例方法:
    * create(viewPage,jsonData,jsonOptions)
      * jsonOptions : 
        * showBackdrop
        * enableBackdropDismiss
        * cssClass
    * present() 
    * onDidDismiss(data => {})
  * 备注:
    * 不要再 app.module.ts 中再声明服务提供者
    * 隐退弹出页面写逻辑写在弹出页面中,ViewController 实例的dismiss方法来隐退弹出页面

 ## Navigation
  * 功能描述: 导航,由 ion-nav 组件创建
  * 可以再任意页面使用 NavController 实例 push 或 pop 页面
  * 再 ion-nav 页面 无法直接使用 NavController ,可以再ion-nav 组件上设置模板变量,然后使用@ViewChild 来获取NavController 实例.
  * 如果push的页面中含有 ion-navbar 组件,则ionic 回自动添加一个回退按钮

## Popover
  * 功能描述: 浮动弹出框,内容没有限制,一般用于详情,设置选项
  * 依赖服务: PopoverController
    * 不需要显示声明服务提供者
    * 实例方法: create(PopOverPage,jsonData,jsonOptions)
    * present(ev:UIEvent) ,如果不传递事件,则默认情况下显示在中间位置,传递事件一般有格好的显示效果
    * dismiss() ,隐退,可也可以调用 ViewController 的 dismiss() 方法来隐退
  * 举例
    ```
    <ion-header>
      <ion-navbar>
        <ion-title>标题</ion-title>
        <ion-buttons end>
          <ion-button ion-button icon-only (click)="presentPopover($event)">
            <ion-icon name="more"></ion-icon>
          </ion-button>
        </ion-buttons>
      </ion-navbar>
    </ion-header>
    ==========
    presentPopover(ev: UIEvent){
      const popover = this.popoverCtrl.create(PopoverPage);
      popover.present({
        ev: ev
      });
    }
    ```  

## Radio
  * 功能描述 : 单选按钮组件
  * 组件: ion-radio 
  * 相关属性: color,checked,value,disabled
  * 相关指令: radio-group 功能扩展指令
    * 扩展指令属性: disabled
  * 使用:  
    ```
    <ion-list radio-group [(ngModel)]="language">
        <ion-list-header>
          Language
        </ion-list-header>
        <ion-item>
          <ion-label>C++</ion-label>
          <ion-radio value="c++"></ion-radio>
        </ion-item>
        <ion-item>
          <ion-label>C</ion-label>
          <ion-radio value="c"></ion-radio>
        </ion-item>
        <ion-item>
          <ion-label>Go</ion-label>
          <ion-radio checked="true" value="go"></ion-radio>
        </ion-item>
        <ion-item>
          <ion-label>Python</ion-label>
          <ion-radio disabled value="python"></ion-radio>
        </ion-item>
      </ion-list>    
    ```
## Range
  * 功能描述:  类似屏幕亮度,音量设置范围条.
  * 组件: ion-range
    * 相关组件: ion-label,ion-icon,需要使用 rang-left,range-right 进行功能扩展
  * 相关属性: 
    * min ,number 范围的最小值
    * max ,number范围的最大值
    * step ,number调控时的步长
    * snaps ,boolean 是否显示刻度,要与 step 一起使用
    * pin ,boolean 移动调节时是否在上面显示数值
    * dualKnobs ,boolean 是否使用双控制按钮,当设置为true时,其绑定的value值需要是一个有lower,和upper的对象.
    * debounce ,number 触发 ionChange 事件 延迟的毫秒数
  * 使用
    ```
    <ion-range></ion-range>
    --------------
    <ion-range min="0" max="100">
      <ion-label range-left>0</ion-label>
      <ion-label range-right>100</ion-label>
    </ion-range>
    ------------------
    <ion-range step="10" snaps="true" [(ngModel)]="sunnyValue">
      <ion-icon name="sunny" range-left></ion-icon>
      <ion-icon name="sunny" range-right></ion-icon>
    </ion-range>
    ```

## Searchbar
  * 功能描述: 搜索框组件
  * 组件: ion-searchbar
  * 相关属性: 
    * animated ,boolean 动画
    * autocomplete, string  on / off
    * autocorrect, string on / off
    * cancelButtonText, string 
    * debounce , number 延迟触发 ionInput 事件的时间 毫秒
    * placeholder, string 
    * spellcheck, string|boolean
    * type ,string
      * text,password,email,number,search,tel,url .默认 search
    * showCancelButton ,boolean 是否显示取消按钮
  * 可以通过双向绑定获取输入的内容
  * 相关事件: 
    * ionInput($event) : 输入事件,可以携带参数 $event, $event.target.value 就是输入的值
    * ionCancel($event) : 取消事件
    * ionClear
  * 实例方法: 
    * setFocus()
    * positionPlaceholder()  
  * 使用
    ```
    <ion-searchbar showCanelButton="true" (ionInput)="onInput($event)" (ionCancel)="onCancel($event)" [(ngModel)]="inputValue">
    ```   

## Segment
  * 功能描述: 类似 tabs 的选项卡
  * 组件: ion-segment, ion-segment-button
    * ion-segment 
      * 相关属性: color
    * ion-segment-button 
      * 相关属性: value,disabled
      * 相关事件: ionSelect

  * 数据双向绑定在 ion-segment 组件上
    ```
    <ion-header>
      <ion-toolbar>
        <ion-segment [(ngModel)]="icon" color="secondary" (ionChange)="onChange($event)">
          <ion-segment-button value="camera">
            <ion-icon name="camera"></ion-icon>
          </ion-segment-button>
          <ion-segment-button value="bookmark">
            <ion-icon name="bookmark"></ion-icon>
          </ion-segment-button>
          <ion-segment-button value="sunny">
            <ion-icon name="sunny"></ion-icon>
          </ion-segment-button>
        </ion-segment>
      </ion-toolbar>
    </ion-header>

    <ion-content padding>
      <ion-segment [(ngModel)]="word" (ionChange)="onChange()">
        <ion-segment-button value="friends">
          Friends
        </ion-segment-button>
        <ion-segment-button value="enemies">
          Enemies
        </ion-segment-button>
      </ion-segment>

      <hr>
      <form [formGroup]="myForm">
        <ion-segment formControlName="mapStyle" color="danger">
          <ion-segment-button value="standard">
            Standard
          </ion-segment-button>
          <ion-segment-button value="hybrid">
            Hybrid
          </ion-segment-button>
          <ion-segment-button value="sat">
            Satellite
          </ion-segment-button>
        </ion-segment>
      </form>
    </ion-content>    
    ```  
    

## Select
  * 功能描述: 选项列表组件
  * 组件:  ion-select , ion-option
  * 相关属性: 
    * cancelText ,string 取消按钮显示的文字
    * okText, string 确定按钮显示的文字
    * interface ,string 弹出框样式, alert,action-sheet,popover
    * multiple , boolean 是否可以多选
    * placeholder , string 没有选择时显示的文字
    * selectOptions , any 与interface 对应的设置
    * selectedText ,string 选择后显示的文本替代 ion-option 的值对应的文本
    * compareWith , Function , 当 ion-option 的value值为对象时
  * 相关事件:
    * ionChange
    * ionCancel
  * 使用: 
    ```
    <ion-item>
      <ion-label>选项</ion-label>
      <ion-select [(ngModel)]="selectedValue" (ionChange)="onChange()">
        <ion-option value="1">选项1</ion-option>
        <ion-option value="2">选项2</ion-option>
        <ion-option value="3">选项3</ion-option>
        <ion-option value="4">选项4</ion-option>
      </ion-select>
    </ion-item>
    ```  

## Slides
  * 功能描述: 轮播(滑动幻灯片)组件
  * 组件: ion-slides ion-slide
  * ion-slides  主要属性
    * autoplay ,boolean 是否自动滚动
    * loop , boolean 是否循环滚动
    * pager , boolean 是否显示控制点(分页)
    * paginationType, string  分页样式 bullets, fraction, progress
    * spaceBetween, number 两张轮播图之间的间隔
    * speed , number 切换速度 毫秒
    * 其他, 文档,源码 too much 
  * slides 实例属性设置
    * slides.freeMode , boolean 手动滚动的样式
    * slides.autoplayDisableOnInteraction , boolean 自动轮播过程成手动干预后是否停止自动轮播
    * slides.stopAutoplay() , 关闭自动轮播( 页面切换时需要关闭 )
    * slides.startAutoplay() , 开启自动轮播 (页面重新切回时开启轮播)
  * slides 相关事件
    * ionSlideTap,ionSlideDoubleTap 单击,双击事件
    * 其他事件 文档,源码, too much
  * 使用
    ```
    <ion-slides #slides pager autoplay loop speed="3000"  spaceBetween="30">
      <ion-slide>
        <h2>Slide 1 </h2>
      </ion-slide>
      <ion-slide>
        <h2>Slide 2 </h2>
      </ion-slide>
      <ion-slide>
        <h2>Slide 3 </h2>
      </ion-slide>
    </ion-slides>
    =====================
    @ViewChild('slides') slides : Slides;


    ngAfterViewInit() {
      this.slides.freeMode = true;
      // 在自动滚动过程中手动操作会中断,设置后禁止中断.
      this.slides.autoplayDisableOnInteraction = false;
    }
  
    ionViewWillEnter() { 
      this.slides.startAutoplay(); 
    }
    ionViewWillLeave() { 
      this.slides.stopAutoplay(); 
    }
    ionViewDidEnter() {

    }
    ```
## Tabs
  * 功能描述: 标签导航组件
  * 组件: ion-tabs , ion-tab
  * ion-tabs相关属性: 
    * selectedIndex , number 设置处于激活状态的标签,默认是0第一个.
    * tabsPlacement , string 标签导航所在位置, bottom / top
    * tabsLayout , string 标签显示样式, icon-top, icon-start, icon-end, icon-bottom, icon-hide, title-hide
    * ion-tab 相关属性
      * root , string 每一个 ion-tab 组件必须绑定root属性指定关联的页面
      * enabled , boolean 是否可用
      * rootParams , object 传递的参数
      * show , boolean
      * tabBadge , string 徽章
      * tabBadgeStyle , string 徽章样式
      * tabIcon , string 图标
      * tabTitle , string 标题
      * tabUrlPath , string 
      * tabsHideOnSubPages , boolean  子页面中隐藏导航标签
    * 使用
    ```
    <ion-tabs>
      <ion-tab tabIcon="flame" tabTitle="热搜热点" tabBadge="10" tabBadgeStyle="danger" [root]="HomePage"></ion-tab>
      <ion-tab tabIcon="jet" tabTitle="精选资讯" [root]="AboutPage"></ion-tab>
      <ion-tab tabIcon="medal" tabTitle="精品商城" [root]="AboutPage"></ion-tab>
      <ion-tab tabIcon="american-football" tabsHideOnSubPages="true" tabTitle="关于" [root]="ContactPage"></ion-tab>
    </ion-tabs>    
    ```

## Toast 
  * 功能描述: 弹出式的短消息
  * 相关服务: ToastController
  * 使用: 
    ```
    let toast = this.toastCtrl.create({
      message: '消息内容',
      duration: 3000,//持续显示的时间
      position: 'top',// 位置 top middle bottom
      cssClass: 'aaa',
      showCloseButton: true,
      closeButtonText: '关闭',
      dismissOnPageChange: true
    });

    toast.onDidDismiss(() = >{
      console.log('Toast 隐退事件');
    });
    toast.present();
    toast.dismiss();

    ```
## Toggle
  * 功能描述: 开关选项组件
  * 组件: ion-toggle
  * 相关属性: 
    * disabled 
    * checked
    * color
  * 使用: 
    ```
    <ion-item>
      <ion-label>接收通知</ion-label>
      <ion-toggle checked color="danger"></ion-toggle>
    </ion-item>
    <ion-item>
      <ion-label>接收通知</ion-label>
      <ion-toggle disabled checked color="dark"></ion-toggle>
    </ion-item>
    <ion-item>
      <ion-label>接收通知</ion-label>
      <ion-toggle [(ngModel)]="toggleValue3"></ion-toggle>
    </ion-item>    
    ```  
## Toolbar
  * 功能描述: 工具条,可以嵌套其他组件
  * 组件:  ion-toolbar
  * 相关属性: color
    * 嵌套组件:
      * ion-buttons ,其属性 end,start,left,right 可以控制显示的位置
      * ion-title
      * ion-slides
      * ion-segment
      * ion-searchbar
      * .....
    * ion-toolbar 一般放在 ion-header 或 ion-footer 内  
    * 使用
    ```
    <ion-toolbar color="danger">
        <ion-buttons start>
          <button ion-button icon-only>
            <ion-icon name="menu"></ion-icon>
          </button>
        </ion-buttons>
        <ion-title>
          Toolbar
        </ion-title>
        <ion-buttons end>
          <button ion-button icon-only>
            <ion-icon name="search"></ion-icon>
          </button>
        </ion-buttons>
      </ion-toolbar>
      <ion-toolbar color="secondary">
        <ion-buttons start>
          <button ion-button icon-only>
            <ion-icon name="menu"></ion-icon>
          </button>
        </ion-buttons>
        <ion-title>
          Toolbar
        </ion-title>
        <ion-buttons end>
          <button ion-button icon-only>
            <ion-icon name="search"></ion-icon>
          </button>
        </ion-buttons>
      </ion-toolbar>
      <ion-toolbar color="dark">
        <ion-buttons start>
          <button ion-button icon-only>
            <ion-icon name="menu"></ion-icon>
          </button>
        </ion-buttons>
        <ion-title>
          Toolbar
        </ion-title>
        <ion-buttons end>
          <button ion-button icon-only>
            <ion-icon name="search"></ion-icon>
          </button>
        </ion-buttons>
      </ion-toolbar>
      <ion-toolbar>
        <ion-buttons start>
          <button ion-button icon-only>
            <ion-icon name="menu"></ion-icon>
          </button>
        </ion-buttons>
        <ion-title>
          Toolbar
        </ion-title>
        <ion-buttons end>
          <button ion-button icon-only>
            <ion-icon name="search"></ion-icon>
          </button>
        </ion-buttons>
      </ion-toolbar>
      <ion-toolbar color="primary">
        <ion-buttons start>
          <button ion-button icon-only>
            <ion-icon name="menu"></ion-icon>
          </button>
        </ion-buttons>
        <ion-title>
          Toolbar
        </ion-title>
        <ion-buttons end>
          <button ion-button icon-only>
            <ion-icon name="search"></ion-icon>
          </button>
        </ion-buttons>
      </ion-toolbar>
      <ion-toolbar color="danger">
        <ion-slides #slides parallax="true" slidesPerView="4" (ionSlideTap)="slideTaped($event)">
          <ion-slide>Slide 1</ion-slide>
          <ion-slide>Slide 2</ion-slide>
          <ion-slide>Slide 3</ion-slide>
          <ion-slide>Slide 4</ion-slide>
          <ion-slide>Slide 5</ion-slide>
          <ion-slide>Slide 6</ion-slide>
          <ion-slide>Slide 7</ion-slide>
          <ion-slide>Slide 8</ion-slide>
          <ion-slide>Slide 9</ion-slide>
          <ion-slide>Slide 10</ion-slide>
        </ion-slides>
        <ion-buttons end>
          <button ion-button>
            <ion-icon name="more"></ion-icon>
          </button>
        </ion-buttons>
      </ion-toolbar>
      <ion-toolbar style="background: red">
        <ion-searchbar></ion-searchbar>
        <ion-buttons end>
          <button ion-button icon-only>
            <ion-icon name="camera"></ion-icon>
          </button>
        </ion-buttons>
      </ion-toolbar>
      <ion-toolbar>
        <ion-buttons start>
          <button ion-button icon-only>
            <ion-icon name="create"></ion-icon>
          </button>
        </ion-buttons>
        <ion-segment>
          <ion-segment-button value="new">New</ion-segment-button>
          <ion-segment-button value="hot">Hot</ion-segment-button>
        </ion-segment>
        <ion-buttons end>
          <button ion-button icon-only>
            <ion-icon name="more"></ion-icon>
          </button>
        </ion-buttons>
      </ion-toolbar>    
    ``` 




## Chip
  * 功能描述: 简单标签组件
  * 组件: ion-chip
  * 通常与子标签 ion-label 组合使用
  * 使用: 
    ```
      <ion-chip>
        <ion-label>Default</ion-label>
      </ion-chip>
      <ion-chip>
        <ion-label color="secondary">Secondary Label</ion-label>
      </ion-chip>
      <ion-chip color="secondary">
        <ion-label color="dark">Secondary Chip Dark Label</ion-label>
      </ion-chip>
      <ion-chip color="danger">
        <ion-label>Danger Chip</ion-label>
      </ion-chip>
      <ion-chip>
        <ion-icon name="heart" color="dark"></ion-icon>
        <ion-label>Defalut</ion-label>
      </ion-chip>
      <ion-chip>
        <ion-avatar>
          <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y" alt="">
        </ion-avatar>
        <ion-label>Defalut</ion-label>
      </ion-chip>    
    ```

## Config
  * 功能描述: app 配置项
  * 文档 for more

## Content
  * 功能描述: 内容组件,可以滚动的区域,一个页面应该只有一个此组件,如果需要其他的可滚动区域可以使用 ionScroll,此组件也可结合 Refresher 组件实现下拉刷新.
  * 组件: ion-content
  * 文档 for more

## Events
  * 功能描述: 事件发布
  * 相关服务: Events
  * 实例方法:
    * events.publish(topic,eventData)
    * events.subscribe(topic,handler)
    * events.unsubscribe(topic,handler)

## Footer
  * 功能描述: 固定在底部的页角组件
  * 组件: ion-footer
  * 使用: 
    ```
    <ion-footer>
      <ion-toolbar>
        <ion-title>Footer</ion-title>
      </ion-toolbar>
    </ion-footer>
    ```
## Header
  * 功能描述: 固定在顶部的页头组件
  * 组件: ion-header
  * 使用: 
    ```
    <ion-header>
      <ion-navbar>
        <ion-title>首页标题</ion-title>
      </ion-navbar>
    </ion-header>
    -----------------
    <ion-header>
      <ion-toolbar>
        <ion-buttons>
          <button ion-button icon-only toggleMenu>
            <ion-icon name="menu"></ion-icon>
          </button>
        </ion-buttons>
        <ion-title>标题</ion-title>
      </ion-toolbar>
    </ion-header>
    ```    

## HideWhen
  * 功能描述: 当符合条件时隐藏组件
  * 类似属性: showWhen
  * 使用: 
    ```
    <h2 hideWhen="ios">Hidden on iOS</h2>
    <h2 hideWhen="android">Hidden on Android</h2>
    -----------------------
    <h2 showWhen="ios">Show on iOS</h2>
    <h2 showWhen="android">Show on Android</h2>
    ```
## Img
  * 功能描述: 图片组件,当一个页面图片较多时可以使用此组件,只加载可以看到的部分.
  * 如果页面中图片不多可以直接使用html 的 img 标签.
  * 相关属性:  
    * src
    * height
    * width
    * alt
    * cache
    * bounds

## InfiniteScroll 
  * 功能描述: 无限滚动组件,当页面滚动到底部时加载触发 ionInfinite 事件,可以捕获此事件并加载更多内容
  * 组件: ion-infinite-scroll , ion-infinite-scroll-content
  * ion-infinite-scroll 相关属性: 
    * enabled , boolean
    * position , string 位置 top / bottom
    * threshold ,string 阀值 控制什么时候触发 ionInfinite 事件
  * ion-infinite-scroll-content 相关属性
    * loadingSpinner ,string 动画
    * loadingText , string 文字
  * ion-infinite-scroll-content  是默认的组件,也可以使用自定义组件
  * 实例方法: 
    * complete
    * enable(shouldEnable: boolean)
    * waitFor() ,接收一个返回 Promise的函数参数
  * 使用: 
    ```
    <ion-infinite-scroll (ionInfinite)="doInfinite($event)">
      <ion-infinite-scroll-content
        loadingSpinner="bubbles"
        loadingText="正在加载数据...">
      </ion-infinite-scroll-content>
    </ion-infinite-scroll>
    --------------------------
    <ion-infinite-scroll (ionInfinite)="$event.waitFor(doInfinite())">
      <ion-infinite-scroll-content></ion-infinite-scroll-content>
    </ion-infinite-scroll>

    ```

## 组建 color 属性
  * color 属性用于指定组建的颜色样式
  * 可用颜色有: light(浅灰色),secondary(绿色),danger(红色),dark(黑色),vibrant,默认(primary)蓝色

## TODO detail

* 直接使用组件 VS 使用普通标签进行增强
  ```
  <ion-list>
    <ion-item>
    </ion-item>
  </ion-list>
  <!-- ----------------------- -->
  <ion-list>
    <button ion-item>
    </button ion-item>
  </ion-list>
  ```
  * icon-start , icon-end  VS item-start , item -end
  ```
  <ion-list>
    <ion-item icon-start>
    <ion-icon name="star"></ion-icon>
    普通文本
    <ion-icon name="arrow-forward" item-end>
    </ion-item>
  </ion-list>
  <!-- ---------------------------- -->
  <ion-list>
    <ion-item>
    <ion-icon name="star" item-start></ion-icon>
    普通文本
    <ion-icon name="arrow-forward" item-end>
    </ion-item>
  </ion-list>
  ```
