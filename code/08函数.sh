#!/bin/bash
function command(){
    echo "这是一个命令函数"
}

function getSub(){
    return `expr 10 + 11`
}

function getParams(){
    echo "参数1:$1"
    echo "参数2:$2"
    echo "参数3:$3"
}
echo "函数调用前"
command
echo "函数调用后"
getSub
echo "函数的返回值是:$?"
getParams "zhangsan" "历史" "wangwu"

