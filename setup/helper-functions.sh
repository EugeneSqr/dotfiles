#!/bin/bash
FAIL='\033[0;31m'
PASS='\033[0;32m'
NC='\033[0m' # No Color


function pass {
    echo -en "\033[2K"
    echo -e "\r${NC}[${PASS}done${NC}] $1"
}


function fail {
    echo -en "\033[2K"
    echo -e "\r${NC}[${FAIL}fail${NC}] $1"
}


function header {
    echo -n "${NC}[...] $1"
}


function progress {
    echo -en "\033[2K"
    echo -en "\r[...] $1"
}


# appends line of text to file (if it's not already there)
# if file not found, creates it
function appendLine {
    if [ ! -f $1 ]; then
        progress "$1 not found"
        touch $1
    fi

    line=$(grep "$2" $1)
    if [ $? -eq 0 ]; then
        progress "$2 already appended"
    else
        echo $2 >> $1
    fi
}
