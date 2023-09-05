#!/usr/bin/env bash
set -e

function append_line {
    grep -Fxq "$2" $1 || echo $2 >> $1
}
