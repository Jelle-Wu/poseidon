FROM base/archlinux:latest

#RUN sed -ie 's/kernel.org/ustc.edu.cn/' /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm
RUN pacman -S --needed --noconfirm vim git gcc perl python2

RUN git clone https://github.com/yon2kong/mss.git /root/.mss
RUN ln -sf .mss/etc/.bash_profile /root/.bash_profile
RUN ln -sf .mss/etc/.bash_profile /root/.bashrc

WORKDIR /app/poseidon
ADD . /app/poseidon

EXPOSE 6900

CMD perl src/poseidon.pl --char-server=127.0.0.1:6900 --map-server=127.0.0.1:6900