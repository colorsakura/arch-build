#!/bin/bash

pkgname=$1

pacman-key --init
pacman -Sy --noconfirm

git clone "https://aur.archlinux.org/$pkgname.git" && cd $pkgname
git rev-parse --short HEAD

if [ ! -z "$INPUT_PREINSTALLPKGS" ]; then
    pacman -Syu --noconfirm "$INPUT_PREINSTALLPKGS"
    makepkg -f --noconfirm
else
    makepkg -sf --noconfirm
fi

