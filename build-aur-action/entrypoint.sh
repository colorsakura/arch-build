#!/bin/bash

pkgname=$1
git clone "https://aur.archlinux.org/$pkgname.git"
cd "$pkgname"
echo $PWD
makepkg -sf --noconfirm
