#!/bin/bash -eu

sum() {
    local sum=0
    for i in "$@"; do
        ((sum += i))
    done
    echo "$sum"
}

echo $(sum {1..5})
