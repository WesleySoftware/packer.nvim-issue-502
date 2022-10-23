FROM archlinux
RUN pacman -Syyu --noconfirm
RUN pacman -Sy --noconfirm neovim wl-clipboard xclip git gcc clang