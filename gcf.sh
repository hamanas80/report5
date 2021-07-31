#!/bin/bash

#引数の数判定
if [ $# -ne 2 ]; then
	echo "input 2 argments"
	exit 1
fi

#引数の両方が整数であることを判定
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then
	echo "input natural number"
	exit 1
fi

#１つ目の引数が正の数であることを判定
if [ $1 -lt 0 ]; then
        echo "First argument is not natural number"
        exit 1
fi

#２つ目の引数が正の数であることを判定
if [ $2 -lt 0 ]; then
        echo "Second argument is not natural number"
        exit 1
fi

#ここから本編（2つの引数の最大公約数を求める。ユークリッド互除法）

str1=$1
str2=$2

while [ ! "${str2}" == "0" ];
do
	temp=${str2}
	str2=`expr ${str1} % ${str2}`
	str1=${temp}
done

echo ${str1}
