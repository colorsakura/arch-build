FROM archlinux:latest

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN date
RUN pacman -Syu base-devel git --noconfirm --overwrite '*' && sed -i '/E_ROOT/d' /usr/bin/makepkg
RUN mkdir -p /root/.config/pacman && echo 'PACKAGER="Xiang.C <iflygo@outlook.com>\n"GPGKEY="102CAF4D17B1F4FFF5E60F49EAA85BCFCA55511D"' > /root/.config/pacman/makepkg.conf
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"] 
