#!/bin/bash
progress "setup dropbox scripts"
wget -q "https://www.dropbox.com/download?dl=packages/dropbox.py" -O ~/bin/dropbox
chmod +x ~/bin/dropbox
pass "setup dropbox scripts"
