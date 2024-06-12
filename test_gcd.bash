#!/bin/bash

# テストケースを実行する
run_test() {
    expected=$1
    shift
    output=$(./gcd.bash "$@")
    if [ "$output" == "$expected" ]; then
        echo "Test passed: $@"
    else
        echo "Test failed: $@"
        echo "Expected: $expected"
        echo "Got: $output"
        exit 1
    fi
}

# スクリプトに実行権限を与える
chmod +x gcd.bash

# テストケース
echo "Running tests..."

# 正常な入力
run_test "最大公約数は 6 です。" 48 18
run_test "最大公約数は 1 です。" 7 3
run_test "最大公約数は 12 です。" 60 48

# エラーケース
run_test "Error: 2つの引数を入力してください." 48
run_test "Usage: ./gcd.bash num1 num2" 
run_test "両方の引数は整数でなければならない。" 48 a
run_test "両方の引数は整数でなければならない。" a 18

echo "Tests completed."