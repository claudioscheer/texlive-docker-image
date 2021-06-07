FROM texlive/texlive:latest

ENV TZ=UTC
ENV TERM=xterm-256color
ENV LANG=C.UTF-8

COPY requirements.sh /requirements.sh
RUN sh /requirements.sh

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

WORKDIR /home
