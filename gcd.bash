#!/bin/bash

# 最大公約数を計算する
gcd() {
    a=$1
    b=$2

    while [ $b -ne 0 ]; do
        temp=$b
        b=$((a % b))
        a=$temp
    done

    printf "最大公約数は $a です。\n"
}
if [ $# -eq 0 ]; then
    printf "Usage: $0 num1 num2\n"
    exit 1
fi

# 引数の数をチェック
if [ $# -ne 2 ]; then
    printf "Error: 2つの引数を入力してください.\n"
    exit 1
fi

# 引数を読み込む
num1=$1
num2=$2


# 引数が整数かどうかをチェック
if ! [[ $num1 =~ ^-?[0-9]+$ ]] || ! [[ $num2 =~ ^-?[0-9]+$ ]]; then
    printf "両方の引数は整数でなければならない。\n"
    exit 1
fi

# GCDを計算して表示
gcd $num1 $num2