# shell script

##  #! 在脚本文件的开头用于指定解释此脚本的shell程序
  * #!/bin/bash
    ```script
    #!/bin/bash
    echo 'Hello World !'
    ```
  * 如果上面的脚本文件有可执行权限，可以直接 ./ 执行。
  * 如果没有可以使用 sh <脚本文件名> 的方式执行，这种方式下 #!/bin/bash 就没用了
    ```bash
    sh a1.sh
    ```
    ```bash
    /bin/bash a1.sh
    ```
  * 增加可执行权限命令 chmod + x <文件>  
    ```bash
    chmod +x a1.sh
    ```
## 注释
  * 以#开头的就是注释
  * 没有多行注释，只能一行一行的加#号
## shell 变量
    ```
    var_name='var_value'
    ```
  * 命名只能使用字母，数字，下划线且不能以数字开头。    
  * 变量名与变量值之间用等号链接且三者之间不能有空格。
  * 不能使用标点符号。
  * 不能使用bash里的关键字。
  * 使用定义好的变量需要在变量名前面加$符，例如 $var_name
  * 变脸的使用也可以是 ${var_name}的形式，${}之间不能有空格(在语句中时，语句要用双引号，单引号会原样输出)
    ```bash
    name='Larry'
    echo $name
    echo ${name}
    echo "My name is ${name} , I'm learning Shell Script "
    ```
  * 反引号（``）可以执行命令
    ```bash
    echo `ls /home`
    for file in `ls /etc`; do
      echo $file
    done  
    ```
### 只读变量
  * 使用 readonly 关键字修饰变量，使变量只读
    ```bash
    name=Larry
    echo $name
    name=Herry
    echo $name
    readonly name
    name=Tom # error
    ```
### 删除变量
  * 使用 unset 命令
  ```bash
  name=larry
  unset name
  ```   
  * unset 命令无法删除只读变量 
  ```bash
    name=larry
    readonly name
    unset name # error 
  ```     
### 变量类型  
  * 局部变量
  * 环境变量
  * shell 变量

## shell 字符串
  * 字符串可使用单引号    
    * 单引号里的内容原样输出，无法使用变量
    * 单引号中不能再使用单引号，即便使用转义符也不行
  * 字符串可以使用双引号
    * 双引号里可以使用变量 $var_name 或 ${var_name}
    * 双引号里可以使用转义符
      ```bash
      name=Larry
      echo "Hi's name is $name and his's brother's name is \"${name}\" too"
      ```
  * 字符串也可以不使用引号
### 字符串拼接
  * 直接连着写,中间不能有空格。
    ```bash
    name=Larry
    greeting="Hello "$name" !"
    ```
  * 使用双引号里嵌套变量
    ```bash
    name=Larry
    greeting1="Hello $name !"
    greeting2="Hi ${name} !"
    ``` 
### 获取字符串长度
  * ${#var_name}
  ```bash
  str="hello word"
  len=${#str}
  echo $len
  ```
### 提取子字符串
  * ${var_name:index:length}
  * index 从0开始
    ```bash
    str="hello word"
    substr=${str:1:4}
    echo $substr  # ello
    ```
### 查找子字符串
  * 使用反引号（``）执行linux命令   
  * e.g 查找字母d或r的位置索引，索引从1开始，未找到返回0。 
  ```bash
  str="hello world"
  index=`expr index "$str" dr`
  echo $index
  ```
## 数组
  * bash 只支持一维数组，没有限定数组的大小
  * 语法格式 
    * var_name=(val1 val2 val3)
    * var_name=( </br>
          val1 </br>
          val2 </br>
          val3 </br>
      ) </br>
    * var_name[0]=val1  </br>
       var_name[1]=val2  </br>
       var_name[2]=val3  </br>
  * 读取数组元素 ${var_name[index]}
    ```bash
    numArr=(11 22 33)
    echo ${numArr[0]}
    ```
  * 数组元素重新赋值
    ```bash
    numArr=(11 22 33)
    echo ${numArr[0]}
    numArr[0]=100
    echo ${numArr[0]}
  * 使用@或*获取数组的所有元素
    ```bash
    numArr=(11 22 33)
    echo ${numArr[@]}  # 11 22 33
    echo ${numArr[*]}  # 11 22 33
    ```  
  * 数组名索引的是数组的第一个元素
    ```bash
    numArr=(11 22 33)
    echo ${numArr}  # 11
    ``` 
### 获取数组元素个数
  * 与获取字符串长度的方法相同
  * ${#var_name[@]}  
  * ${#var_name[*]}  
    ```bash
    numArr=(11 22 33)
    echo ${#numArr[*]}  # 3
    echo ${#numArr[@]}  # 3
    ```
  * 获取单个元素的长度
    ```bash
    numArr=(1111 22 33)
    echo ${#numArr[0]}  # 4
    ```
## 向脚本传递参数
  * 在运行脚本时可以向脚本传递参数。
  * 脚本内以 $n 或 ${n} 的方式使用参数，n是数字 $0是执行的文件名，$1 是第一个参数。* $# 代表传递给脚本的参数个数
  * $* 或者 $@ 以一个字符串的形式获取所有的参数   
  * $$ 当前脚本运行的进程ID号。
  * $! 后台运行的最后一个进程的ID号。
  * $- 显示Shell使用的当前选项，与set命令功能相同。
  * $? 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
  * $* 与 $@ 区别：（可以使用for循环检测）
    * 相同点：都是引用所有参数。
    * 不同点：只有在双引号中体现出来。假设在脚本运行时写了三个参数 1、2、3，，则 " * " 等价于 "1 2 3"（传递了一个参数），而 "@" 等价于 "1" "2" "3"（传递了三个参数）。
  ```bash
  echo "${0}"
  echo "${1}"
  echo "$2"
  echo $#
  echo $*
  echo $@
  echo $$
  echo $!
  echo $-
  echo $?
  ```
## 运算符
  * 算术运算符
    * + - * / % = == !=
  * 关系运算符 ( 只能用于int类型数字 )
    * -eq -ne -gt -lt -ge -le
  * 布尔运算符
    * !  -o  -a
  * 逻辑运算符( 要使用 [[]] )
    * &&  ||
  * 字符串运算符
    * = != -z  -n str
  * 文件测试运算符
    * -b -c -d -f -g -k -p -u -r -w -x -s -e file
  * 源生的bash不支持简单的数学运算，但是可以通过其他命名来实现，如awk，expr。expr是表达式求值工具，可以使用他来完成表达求值操作。  

### 数学运算
  ```bash
  result=`expr 1 + 1`
  echo $result
  result=`expr 2 \* 8 `
  echo $result
  result=`expr 9 / 4`
  echo $result
  result=`expr 1 == 2`
  echo $result # 0
  result=`expr 1 != 2`
  echo $result # 1
  if [ 1 == 2 ]
  then
    echo '1 == 2'
  fi 
  if [ 1 != 2 ]
  then
    echo '1 != 2'
  fi   
  ```
  * 注意运算符两边要空格
  * 乘法运算要转义 \*
  * 另一种算术运算
    ```bash
    echo $[1+1]
    echo $[3 * 4]
    echo $[4 * 2]
    echo $[4 % 2]
    ```

### 关系运算符，只能用于int类型数字
  * -eq 等于
  * -ne 不等于
  * -gt 大于
  * -lt 小于
  * -ge 大于等于
  * -le 小于等于
  ```bash
  n1=10
  n2=20
  if [ $n1 -eq $n2 ]
  then
    echo "n1 == n2"
  else
    echo "n1 != n2"  
  fi 
  ```
  * [  ] 与变量之间要有空格
### 布尔运算符
  * !   非
  * -o 或
  * -a 与
  ```bash
  a=10
  b=20
  if [ $a -eq 10 -a $a -lt $b ]
  then
    echo 'ok'
  else
    echo 'not ok'
  fi    
  ```
### 逻辑运算符
  * &&
  * ||
  * 必须使用 [[  ]]
  ```bash
  a=10
  b=20
  if [[ $a -eq 10 && $a -lt $b  ]]
  then
    echo "ok"
  else
    echo "not ok"  
  fi  
  ```
### 字符串运算符
  * = 判断字符串是否相等,相等返回 true (变量为空时或不存在时无法使用)
  * != 判断字符串是否相等,不相等返回 true (变量为空时或不存在时无法使用)
  * -z 判断字符串长度是否为0，为0 返回 true
  * -n 判断字符串长度是否为0，不为0 返回 true
  * str 判断字符串是否为空，不为空返回true
  ```bash
  a='aaa'
  b='bbb'
  c=''
  if [ -z $a  ]
  then
    echo 'dddd'
  fi
  ```
### 文件测试
  * -b path ， 检测是否时块设备文件，如果是返回true
  * -c path ， 检测是否是字符设备文件，是，返回true  
  * -g path ， 检测文件是否设置了 SGID位
  * -k paht ， 检测文件是否设置了粘着位
  * -p path ， 检测文件是否是有名管道
  * -u path ， 检测文件是否设置了 SUID 位

  * -f path  ， 检测是否是普通文件（既不是目录也不是设备文件）
  * -d path ， 检测是否是目录
  * -r path  ， 检测文件是否可读
  * -w path ， 检测文件是否可写
  * -x path  ， 检测文件是否可执行
  * -s path  ， 检测文件是否可为空（文件大小是否大于0），不为空返回true
  * -e path  ， 检测文件或目录是否存在，存在返回true
## echo 用于打印输出字符串
  * echo string # 输出普通字符串
  * echo "hello Word" # 输出普通字符串
  * echo "His's name is \"Larry\"" # 使用转义输出引号"
  * echo -e "this is Larry \n that is Herry" # 使用-e参数 开启转义 \n 换行
  * echo "my name is $var_name"  # 使用变量
  * echo -e "Hello \c"  </br> 
     echo "Word !"  # 使用 -e 开启转义，-c 不换行
  * echo 'the value of $name is Larry '   # 单引号原样输出，不取变量
  * echo `date`  # 输出反引号执行结果
## printf
  * 类似 echo ,打印输出字符串
  * printf模仿C语言的printf()函数
  * 语法 ： printf  format-string [arguments...]
    ```bash
    printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
    printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
    printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
    printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876
    ```
## test 命令
  * 数值测试
  * 字符串测试
  * 文件测试
### 数值测试
  * -eq 、-ne、-gt、-ge、-lt、-le
  ```bash
  n1=100
  n2=200
  if test $[n1*2] -eq $[n2]
  then 
    echo 'n1 等于 n2'
  else
    echo 'n1 不等于 n2'  
  fi  
  ```
  * $[] 括号内执行基本的算术运算
### test 字符串测试
  * =、!=、-z、-n
  ```bash
  s1='Larry'
  s2='Herry'
  if test $s1 = $s2
  then
    echo 's1 等于 s2'
  else
    echo 's1 不等于 s2'  
  fi
  ```  
### test 测试文件
 *  -e 文件名	如果文件存在则为真
 *  -r 文件名	如果文件存在且可读则为真
 *  -w 文件名	如果文件存在且可写则为真
 *  -x 文件名	如果文件存在且可执行则为真
 *  -s 文件名	如果文件存在且至少有一个字符则为真
 *  -d 文件名	如果文件存在且为目录则为真
 *  -f 文件名	如果文件存在且为普通文件则为真
 *  -c 文件名	如果文件存在且为字符型特殊文件则为真
 *  -b 文件名	如果文件存在且为块特殊文件则为真
  ```bash
  cd /bin
  if test -e ./bash
  then
    echo '文件存在' 
  else
    echo '文件不存在'  
  fi  
  ```
### test 与 -a -o ！  （与或非运算符）结合使用 ！的优先级最高其次是-a最后是-o
  ```bash
  cd /bin
  if test -e ./lalaFile -o -e ./bash
  then
    echo '至少存在一个文件'
  else
    echo '两个文件都不存在'
  fi    
  ```
## 流程控制
  * 不能有空分支，分支里如果没有内容就不要写这个分支
  * 下面的写法会报错  
  ```bash
  if [ true ]
  then
    echo 'true'
  else
  # error
  fi  
  ```
### if then fi
### if then else fi
### if then elif then else fi
  ```bash
  if [ 1 -eq 2 ]
  then
    echo 'true 1'
  elif [ 1 -gt 2 ]
  then 
    echo "true 2"
  else 
    echo "true 3"
  fi  
  ```
### for 循环
  * 多行写法
  ```bash
  for val in aa bb vv
  do
    echo $val
  done 
  ```
  * 单行写法
  ```bash
  for val in aa bb vv; do echo $val ;done 
  ```
### while 循环
  ```bash
  n=1
  while ((n <= 5))
  do
    echo $n
    let "n++"
  done    
  ```
  * 从键盘读取输入
  ```bash
  echo '按下 <CTRL-D> 退出'
  echo -n '输入你最喜欢的网站名: '
  while read FILM
  do
      echo "是的！$FILM 是一个好网站"
  done
  ```
  * 无限循环
    ```bash
    n=0
    while ：
    do
      echo "$n"
      let "n++"
      if [ $n -gt 100 ]
      then
        break
      fi  
    done  
    ```
    ```bash
    n=1
    while true
    do
      echo $n
      let "n++"
      if [ $n -gt 100 ] 
      then 
        break
      fi
    done
    ```
    ```bash
    n=1
    for (( ; ; ))
    do
      echo $n
      let "n++"
      if [ $n -gt 100 ] 
      then 
        break
      fi
    done
    ```  
### until 循环
  ```bash
  n=1
  until [ $n -gt 100 ]
  do
    echo $n
    let "n++"
  done
  ```  
###  case  
  ```bash
  n=1
  case $n in
    1) 
      echo '11111'
    ;;
    2)
      echo '2222'
    ;;
    *)
      echo 'default'
  esac
  ```     
### break 跳出循环
  ```bash
  while :
  do
    echo -n "输入1～3的数字："
    read n
    case $n in
      1) 
        echo '11111'
      ;;
      2)
        echo '2222'
      ;;
      3)
        echo '33333'
      ;;
      *)
        echo '***done***'
        break
      ;;  
    esac
  done
  ```   
### continue 结束当前循环，进入下一次循环
  ```bash
    while :
    do
      echo -n "输入1～3的数字："
      read n
      case $n in
        1) 
          echo '11111'
        ;;
        2)
          echo '2222'
        ;;
        over)
          echo '-----over------'
          break
        ;;
        *)
          echo '***continue***'
          continue
        ;;  
      esac
    done
  ```
## 函数
  * 定义函数可以使用function关键字，也可以不使用
  * 调用函数直接使用函数名，不加括号
  * function funName(){}
  ```bash
  function fun1() {
    echo 'fun1'
  }
  fun1
  ```
  * funName() {}
  ```bash
  fun2() {
    echo 'fun2'
  }
  ```
### 有参数和返回值的函数
  ```bash
  funAdd() {
    return $(( $1 + $2 ))
  }
  funAdd 1 2
  echo $?
  ```
  * 函数参数使用 $n 或 ${n} 获取
  * $#	传递到脚本的参数个数
  * $*	以一个单字符串显示所有向脚本传递的参数
  * $$	脚本运行的当前进程ID号
  * $!	后台运行的最后一个进程的ID号
  * $@	与$*相同，但是使用时加引号，并在引号中返回每个参数。
  * $-	显示Shell使用的当前选项，与set命令功能相同。
  * $?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误

## 文件导入
  * .   path
  * source path  