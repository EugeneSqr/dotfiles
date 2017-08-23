#!/bin/bash
progress "setting up terminator"
if ! isInstalled terminator; then
    fail "setting up terminator:" "install terminator first"
    return
fi
