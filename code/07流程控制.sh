#!/bin/bash

file="./04.sh"
if [ -f $file ]
then 
    echo "这是文件"
elif [ -d $file ]
then
    echo "这是文件夹"
else
    echo "不知道是啥"
fi           


for file in `ls /var`
do
    echo $file
done

int=0
while (( $int <= 10 ))
do
    echo "当前的int的值为:${int}"
int=`expr ${int} + 1`
done    