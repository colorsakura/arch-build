#!/bin/bash

pkgname=$1
localpath=$PWD

pacman-key --init
pacman -Sy --noconfirm

if [ ! -z "$INPUT_LOCALSOURCE" ]; then
    echo "build from local source"
    mkdir ./buildpkgs
    cd ./pkgfiles/$pkgname
else
    echo "build from aur package"
    git clone "https://aur.archlinux.org/$pkgname.git" && cd $pkgname
    git rev-parse --short HEAD
fi

if [ ! -z "$INPUT_PREINSTALLPKGS" ]; then
    echo "manu"
    pacman -Syu --noconfirm "$INPUT_PREINSTALLPKGS"
    makepkg -f --noconfirm
    if [ ! -z "$INPUT_LOCALSOURCE" ]; then
        cp *.pkg.tar.zst $localpath/buildpkgs/
    fi
else
    echo "auto"
    makepkg -sf --noconfirm
    if [ ! -z "$INPUT_LOCALSOURCE" ]; then
        cp *.pkg.tar.zst $localpath/buildpkgs/
    fi
fi

# vim: set sw=4 et: