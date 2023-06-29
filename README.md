[![BUILD](https://github.com/colorsakura/arch-build/actions/workflows/build.yml/badge.svg)](https://github.com/colorsakura/arch-build/actions/workflows/build.yml)

## 使用

1. 下载密钥: `curl -O -L "https://arch.52bilibili.com/iflygo.repo.key"`
2. 导入密钥: `sudo pacman-key --add iflygo.repo.key && sudo pacman-key --lsign-key Chauncey`
3. 编辑`pacman.conf`:

```conf
# cat /etc/pacman.conf
[iflygo]
Server = https://arch.52bilibili.com
```

## TODO
