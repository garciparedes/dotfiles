#!/usr/bin/env bash

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
  fzf
  
  
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
