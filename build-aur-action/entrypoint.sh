#!/bin/bash

pkgname=$1
git clone "https://aur.archlinux.org/$pkgname.git"
cd "$pkgname"
makepkg -sf --noconfirm
