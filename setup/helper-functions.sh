#!/bin/bash
function appendLine {
    grep -Fxq "$2" $1 || echo $2 >> $1
}
