#!/bin/bash

pkgname=$1
useradd builder -m
su builder
cd $HOME
git clone "https://aur.archlinux.org/$pkgname.git"
cd "$pkgname"
makepkg -sf --noconfirm
