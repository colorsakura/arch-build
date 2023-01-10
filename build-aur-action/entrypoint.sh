#!/bin/bash

pkgname=$1

pacman-key --init
pacman -Sy --noconfirm

if [ ! -z "$INPUT_PREINSTALLPKGS" ]; then
    pacman -Syu --noconfirm "$INPUT_PREINSTALLPKGS"
fi

git clone "https://aur.archlinux.org/$pkgname.git"
cd "$pkgname"
echo $PWD
makepkg -sf --noconfirm
