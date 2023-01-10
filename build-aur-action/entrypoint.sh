#!/bin/bash

pkgname=$1

cd $HOME
git clone "https://aur.archlinux.org/$pkgname.git"
cd "$pkgname"
makepkg -sf --noconfirm
