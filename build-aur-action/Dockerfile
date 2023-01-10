FROM archlinux:latest

RUN useradd builder -m
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN date
RUN pacman -Syu base-devel git --noconfirm --overwrite '*'
COPY entrypoint.sh /entrypoint.sh
USER builder
ENTRYPOINT ["/entrypoint.sh"] 
