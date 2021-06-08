FROM claudioscheer/build-neovim AS neovim
WORKDIR /

FROM texlive/texlive:latest
WORKDIR /home

ENV TZ=UTC
ENV TERM=xterm-256color
ENV LANG=C.UTF-8

RUN mkdir /usr/nvim
COPY --from=neovim /nvim/ /usr/nvim/

COPY requirements.sh /requirements.sh
RUN sh /requirements.sh

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute
