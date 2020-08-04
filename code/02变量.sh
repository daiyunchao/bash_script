#!/bin/bash
my_name="daiyunchao"
echo $my_name
new_name="this is new name, ${my_name}" 
echo $new_name
echo ${#new_name}

name="zhangsan"
echo ${name:1:4}

name_arr=('zhangsan' 'lisi' 'wangwu')
echo "${name_arr[0]}"
name_arr[0]="zhaoliu"
echo "${name_arr[0]}"
echo ${name_arr[@]}
echo ${#name_arr[@]}