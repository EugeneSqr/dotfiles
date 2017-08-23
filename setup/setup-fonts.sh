#!/bin/bash
progress "setup powerline fonts"
fontDir=~/.local/share/fonts
fontName=PowerlineSymbols.otf
mkdir -p $fontDir
if [ ! -f $fontDir/$fontName ]; then
    wget https://github.com/Lokaltog/powerline/raw/develop/font/$fontName -qP $fontDir

    fc-cache -f -v
fi

fontConfigDir=~/.config/fontconfig/fonts.conf
fontConfigName=10-powerline-symbols.conf
mkdir -p $fontConfigDir

if [ ! -f $fontConfigDir/$fontConfigName ]; then
    wget https://github.com/Lokaltog/powerline/raw/develop/font/$fontConfigName -qP $fontConfigDir
fi

pass "setup powerline fonts"
