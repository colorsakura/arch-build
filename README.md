[![BUILD](https://github.com/colorsakura/arch-build/actions/workflows/build.yml/badge.svg)](https://github.com/colorsakura/arch-build/actions/workflows/build.yml)

Use Github Actions to build Arch packages.
For more information, please read [my post](https://viflythink.com/Use_GitHubActions_to_build_AUR/) (Chinese).

The uploadToOneDrive job is optional, you can use [urepo](https://github.com/vifly/urepo) to create your package repositorie after upload to OneDrive.

## 使用

1. 下载密钥: `curl -O "https://arch.52bilibili.com/iflygo.repo.key"`
2. 导入密钥: `sudo pacman-key -add iflygo.repo.key && sudo pacman-key --lsign-key Chauncey`
3. 编辑`pacman.conf`:

```conf
#/etc/pacman.conf
[iflygo]
Server = https://arch.52bilibili.com
```

## TODO
