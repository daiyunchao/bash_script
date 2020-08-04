### bash脚本的学习记录
> 这个库是我在:https://www.runoob.com/linux/linux-shell.html 过程中,写下的一些笔记


#### 第一节

1. 在终端中输出内容 `echo echo "this is something"`

2. `#!/bin/bash`的意思是下面的内容是bash脚本,使用 `/bin/bash`命令去执行

3. 执行脚本的两种方式:

3.1 `cd`到脚本所在的目录中,执行`./01.sh` 为什么一定要加上`./`去执行脚本,因为如果不加就只会再`/bin, /sbin, /usr/bin，/usr/sbin` 这些地方去找该脚本,如果遇到没有权限,可以先执行`chmod +x 01.sh`再执行

3.2 `/bin/bash ./bash_script/code/01.sh` 先指定执行的命令 参数是脚本的地址


#### shell的变量
##### 基础

1. `my_name="daiyunchao"` 等号之间不能有空格,其他规则和`javascript`类似

2. 可以通过语句来赋值变量,下面的例子将会把/etc中的名字赋值给item
`for item in $(ls /etc)`

3. 使用变量,在申明的变量前添加$符号即可,也可以类似于`js`一样,推荐使用带有{}的形式
`echo $my_name`
`echo ${my_name}`

4. 创建只读变量关键字 `readonly`

`myUrl="www.google.com" readonly myUrl`

5. 删除变量,使用关键字 `unset`,但删除的时候不能删除只读变量
`unset myUrl`

##### 字符串
6. 字符串类型,和`javascript`相同,可以使用单引号或是双引号,BUT,单引号中的变量是无效的,东西都会原样输出,并且不能出现转义符号

7. 获取字符串长度 `${#变量名}` 

8. 获取子字符串 类似`javascript`中的`substring` 和 `javascript`的区别
```javascript
var a="zhangsan";
a.substring(1,4);
//"han"
```

```bash
name="zhangsan"
echo ${name:1:4} #hang
```

##### 数组

9. 只支持一维数组

10. 申明方式 

10.1 `array_name=(value0 value1 value2 value3)`

10.2 `array_name[0]=value0 array_name[1]=value1 array_name[n]=valueN`

11. 读取方式 ${数组名[下标]}
```bash
name_arr=('zhangsan' 'lisi' 'wangwu')
echo "${name_arr[0]}" #获取第0个值
name_arr[0]="zhaoliu" #修改第0个值
echo "${name_arr[0]}" #再次获取第0个值
```
12. 获取数组中的全部元素 `${array_name[@]}`

13. 获取数组中的元素个数 `${#array_name[@]}`


#### shell传递参数

1. 在执行脚本时可以给脚本添加一些参数 `./01.sh zhangsan 19`,获取方式是 `$1` 第一个参数 `$2` 第二个参数,`$0` 代表脚本本身
```bash
echo "脚本名:$0"
echo "参数1:$1"
echo "参数2:$2"
echo "参数3:$3"
echo "参数个数 $#"
echo "用字符串的形式输出参数 $*"
```

2. 特殊参数:

| 参数   |      说明      |
|----------|:-------------:|
| $# |  传递到脚本的参数个数 |
| $* |  以一个单字符串显示所有向脚本传递的参数   |
| $@ |  与$*相同，但是使用时加引号，并在引号中返回每个参数。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。   |
| $$ |  当前进程号 |
| $! |  后台运行的最后一个进程的ID号 |
| $? |  显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。 |

3. `$*` 和 `$@` 的区别 `$*`会将参数变成一个字符串,而`$@`不会 例子:
```bash
echo "-- \$* 演示 ---"
for i in "$*"; do
    echo $i
done

echo "-- \$@ 演示 ---"
for i in "$@"; do
    echo $i
done
```


#### shell运算

1. 表达式求值 `expr`
```bash
val=`expr 2 + 2`
echo "两数之和为 : $val"
```
2. 注意点
2.1 运算符前后一定要有空格
2.2 完整的表达式必须有``包含
2.3 乘号(*)前边必须加反斜杠(\)才能实现乘法运算

3. 常见运算符和`javascript`类似 `+ - * / % = == !=`

##### 关系运算符

关系运算符,只支持数字或是字符串类型的数值

| 运算符   |      说明      | javascript中 |
|----------|:-------------:|:-------------:|
| -eq |  检查两个数是否相等 相等返回 true | == |
| -ne |  检测两个数是否不相等，不相等返回 true | != |
| -gt |  检测左边的数是否大于右边的，如果是，则返回 true。	 | >= |
| -lt |  检测左边的数是否小于右边的，如果是，则返回 true | <=> |
| -ge |  检测左边的数是否大于等于右边的，如果是，则返回 true | > |
| -le |  检测左边的数是否小于等于右边的，如果是，则返回 true | < |

例子:
```bash
a=10
b=20

if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi
```

##### 布尔运算符
| 运算符   |      说明      | javascript中 |
|----------|:-------------:|:-------------:|
| ! |  非 true返回false false返回true | ! |
| -o |  一个为true 返回true | || |
| -a |  两个为true 返回true,否则返回false | && |

例子:
```bash
a=10
b=20

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a == $b: a 等于 b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi
```

##### 逻辑运算符
| 运算符   |      说明      | javascript中 |
|----------|:-------------:|:-------------:|
| && |  逻辑的 AND | && |
| || |  逻辑的 OR | || |

```bash
a=10
b=20

if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi
```

##### 字符串运算符
| 运算符   |      说明      | javascript中 |
|----------|:-------------:|:-------------:|
| =  | 检测两个字符串是否相等，相等返回 true。 | == |
| != | 检测两个字符串是否相等，不相等返回 true。 | != |
| -z | 检测字符串长度是否为0，为0返回 true。 | str.length==0 |
| $ | 检测字符串是否为空，不为空返回 true。 | =="" |

例子:
```bash
a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi
```

##### 文件测试运算符
| 运算符   |      说明      | 例子 |
|----------|:-------------:|:-------------:|
| -d file  | 检测文件是否是目录，如果是，则返回 true |  |
| -f file  | 检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。 |  |
| -r file  | 检测文件是否可读，如果是，则返回 true。 |  |
| -x file  | 检测文件是否可执行，如果是，则返回 true。	 |  |
| -s file  | 检测文件是否为空（文件大小是否大于0），不为空返回 true。	 |  |
| -e file  | 检测文件（包括目录）是否存在，如果是，则返回 true。	 |  |

```bash

file="/var/www/runoob/test.sh"
if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi
```

#### echo

1. read 可以同输入流中获取变量
```bash
read name
echo "${name} is input name"
```

2. `\n` 输出换行

3. `\c` 显示的不换行输出

4. 执行一个命令 使用`` 
```bash
echo `date`
```

#### test命令
用于检测条件是否成立,它可以进行数值、字符和文件三个方面的测试
数值可以使用到的操作符 `-eq -ne -gt -ge -le -lt`
```bash
num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
else
    echo '两个数不相等！'
fi
```

字符串测试 `= != -z -n`

```bash
num1="ru1noob"
num2="runoob"
if test $num1 = $num2
then
    echo '两个字符串相等!'
else
    echo '两个字符串不相等!'
fi
```

文件检测 `-e 文件名 -r -w -x -s(如果文件存在并且至少有一个字符串为true) -d -f`
```bash
cd /bin
if test -e ./bash
then
    echo '文件已存在!'
else
    echo '文件不存在!'
fi
```

#### 流程控制
1. `if else`
直接看例子:
```bash
a=10
b=20
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi
```

2. `for in`
例子:
```bash
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done
```

3. `while`
例子:
```bash
int=0
while (( $int <= 10 ))
do
    echo "当前的int的值为:${int}"
int=`expr ${int} + 1`
done    
```

4. `case` 语法中的`;;`表示的意思和`break`相同
语法
```bash
case 值 in
模式1)
    command1
    command2
    ...
    commandN
    ;;
模式2）
    command1
    command2
    ...
    commandN
    ;;
esac
```

例子:
```bash
echo '输入 1 到 4 之间的数字:'
echo '你输入的数字为:'
read aNum
case $aNum in
    1)  echo '你选择了 1'
    ;;
    2)  echo '你选择了 2'
    ;;
    3)  echo '你选择了 3'
    ;;
    4)  echo '你选择了 4'
    ;;
    *)  echo '你没有输入 1 到 4 之间的数字'
    ;;
esac
```

跳出循环 使用 `break` 和 `continue` `break`命令允许跳出所有循环和(`javascript`相同) `continue` 也同`javascript`类似,只是跳出这一次的循环

#### Shell函数
语法:
```bash
[ function ] funname [()]

{

    action;

    [return int;]

}
```
`function` 和 `return` 关键字 可有可无 如果没有显示的`return`则表示执行的是命令
如果有返回值必须是0-255的int类型的返回值
```bash
function command(){
    echo "这是一个命令函数"
}
echo "函数调用前"
command
echo "函数调用后"
```

如果函数有返回值,则用过`$?`来获取

```bash
function getSub(){
    return `expr 10 + 11`
}
getSub
echo "函数的返回值是:$?"
```

如何给函数传递参数,函数内部如何获取这些参数,传递方式和获取方式同执行文件相同
```bash
function getParams(){
    echo "参数1:$1"
    echo "参数2:$2"
    echo "参数3:$3"
}
getParams "zhangsan" "历史" "wangwu"
```

#### 输入输出重定向
| 语法   |      说明      |
|----------|:-------------:|
| command > file  | 将输出重定向到 file。可做日志 |
| command < file  | 将输入重定向到 file。可用监听的方式做触发器 |
| command >> file  | 将输出以追加的方式重定向到 file |

输出到文件:
```bash
#!/bin/bash
file='./test.txt'
who > $file
```

#### sh文件包含,用于脚本的封装
类似于`javascript`中的引用
语法是 : `source filename`
例子:
创建一个文件名叫 tools.sh
```bash
#!/bin/bash
url="http://www.runoob.com"
```
引用这个文件
```bash
#!/bin/bash
source ./tools.sh
echo $url
```