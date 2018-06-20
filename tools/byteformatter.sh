#!/bin/bash
if [[ $1 -lt 1024 ]]; then
    echo "$1""B"
elif [[ $1 -lt $((1024 ** 2)) ]]; then
    fmt=$(printf "%.2f" `echo "scale=2;$1/1024"|bc`)
    echo "$fmt""K"
elif [[ $1 -lt $((1024 ** 3)) ]]; then
    fmt=$(printf "%.2f" `echo "scale=2;$1/1024/1024"|bc`)
    echo "$fmt""M"
elif [[ $1 -lt $((1024 ** 4)) ]]; then
    fmt=$(printf "%.2f" `echo "scale=2;$1/$((1024 ** 3))"|bc`)
    echo "$fmt""G"
elif [[ $1 -lt $((1024 ** 5)) ]]; then
    fmt=$(printf "%.2f" `echo "scale=2;$1/$((1024 ** 4))"|bc`)
    echo "$fmt""T"
else
    fmt=$(printf "%.2f" `echo "scale=2;$1/$((1024 ** 5))"|bc`)
    echo "$fmt""P"
fi
