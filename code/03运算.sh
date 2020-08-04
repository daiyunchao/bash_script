#!/bin/bash
val=`expr 2 + 2`
echo "两数之和为 : $val"
a=10
b=20
if [ 10 -eq 20 ]
then 
    echo "true"
else
    echo "false"
fi

stra="a"
strb="a"
if [ $stra == $strb ]
then
    echo "相等"
else
    echo "不相等"
fi        