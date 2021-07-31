#!/bin/bash

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

# テスト開始

# test1:正常動作の確認（2と4を入力したら2を出力する）
echo "2" > ${ans}
./gcf.sh 2 4 > ${result}
diff ${ans} ${result} || echo "error in test1" >> ${err}


# test2:引数の数が足りない(3を入力）
echo "input 2 argments" > ${ans}
./gcf.sh 3 > ${result}
diff ${ans} ${result} || echo "error in test2" >> ${err}

# test3：入力されたのが整数ではない（文字または小数を入力）
echo "input natural number" > ${ans}
./gcf.sh h h > ${result}
diff ${ans} ${result} || echo "error in test3" >> ${err}

# test4-1：入力された最初の引数が正の数ではない（引数が自然数であることの必要条件）
echo "First argument is not natural number" > ${ans}
./gcf.sh -1 1 > ${result}
diff ${ans} ${result} || echo "error in test4-1" >> ${err}

# test4-2：入力された2つめの引数が正の数ではない（引数が自然数であることの必要条>件）
echo "Second argument is not natural number" > ${ans}
./gcf.sh 1 -1 > ${result}
diff ${ans} ${result} || echo "error in test4-2" >> ${err}


# エラーログの確認と後片付け
if [ -f ${err} ]; then
	cat ${err}
	rm /tmp/$$-*
	exit 1
fi
