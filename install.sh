#!/usr/bin/env bash

echo "Installing system depedencies..."

add-apt-repository universe

apt upgrade

apt install -y \
  vim \
  tmux \
  fish \
  git \ 
  curl \
  fd-find \
  textlive-full \
  ruby-full \
  ruby-bundler \
  gnome-shell-extensions \
  gnome-sushi \
  vim-gtk \
  unrar \
  npm \
  nodejs \
  bat \
  ripgrep \
  lm-sensors \
  xclip \
  fzf \
  filezilla \
  xserver-xephyr \
  pinta \ 
  gparted \
  gimp \ 
  ncdu \ 
  xvfb \
  tree \
  htop \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  llvm \
  libncurses5-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libffi-dev \
  liblzma-dev \
  python-openssl \
  net-tools \
  dconf-editor

  
echo "Installing Pyenv..."    
curl https://pyenv.run | bash

echo "Installing Rust..."  
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
