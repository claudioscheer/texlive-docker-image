apt-get update
apt-get install -y apt-utils \
    curl \
    software-properties-common \
    wget \
    git \
    tmux \
    xclip \
    zip \
    unzip \
    dialog

# OpenGL
apt-get install -y -qq --no-install-recommends \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    libxext6 \
    libx11-6 \
    mesa-utils \
    glmark2

ln -s /usr/nvim/bin/nvim /usr/bin/vim

curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs
npm install -g yarn

wget https://github.com/latex-lsp/texlab/releases/download/v3.1.0/texlab-x86_64-linux.tar.gz -O texlab.tar.gz
tar -zxvf texlab.tar.gz
mv texlab /usr/bin

mkdir -p ~/.config/nvim
wget https://raw.githubusercontent.com/claudioscheer/dotfiles/master/.config/nvim/init.vim -O ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
/usr/nvim/bin/nvim --headless -E +PlugInstall +qall
mkdir ~/.vim/undodir -p

wget https://raw.githubusercontent.com/claudioscheer/dotfiles/master/.tmux.conf -O ~/.tmux.conf

cat >> ~/.bashrc<< EOF
alias ga="git add"
alias gl="git pull"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpf!="git push --force"
alias gsb="git status -sb"
alias gc="git commit -S"
alias gac="ga . && gc"

alias cd2="cd ../.."
alias cd3="cd2 && cd .."
alias cd4="cd3 && cd .."

alias xclip="xclip -sel clip"
alias tb="nc termbin.com 9999"

stty -ixon

export EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"
export PATH=$PATH:/usr/nvim/bin
EOF

# Clean build files.
rm -rf /requirements.sh
rm -rf texlab.tar.gz
rm -rf /var/lib/apt/lists/*
rm -rf /neovim
