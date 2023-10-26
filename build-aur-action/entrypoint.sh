#!/bin/bash

pkgname=$1
localpath=$PWD

pacman-key --init
pacman -Sy --noconfirm

mkdir ./buildpkgs

git clone https://github.com/colorsakura/repo.git

if [ -d "repo/archlinux/${pkgname}" ]; then
	cd repo/archlinux/${pkgname}
	makepkg -sf --noconfirm
	cp *.pkg.tar.zst $localpath/buildpkgs/
else
	echo "build from aur package"
	git clone "https://aur.archlinux.org/$pkgname.git" && cd $pkgname
	git rev-parse --short HEAD

	makepkg -sf --noconfirm
	cp *.pkg.tar.zst $localpath/buildpkgs/
fi

# vim: sw=4 noet:
