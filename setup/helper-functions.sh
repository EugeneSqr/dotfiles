#!/bin/bash
function appendLine {
    if [ ! -f $1 ]; then
        touch $1
    fi

    line=$(grep "$2" $1)
    if [ ! $? -eq 0 ]; then
        echo $2 >> $1
    fi
}
