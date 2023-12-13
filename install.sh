#!/bin/sh
# Setup Install Script that must be:
# - Must be Distro Agnostic
# - uses Minimal and POSIX compliant toolchain

# install nix
curl -L https://nixos.org/nix/install | sh -s -- --daemon

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install cli packages
nix-env -iA \
	nixpkgs.neovim \
	nixpkgs.git \
	nixpkgs.zsh \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.tldr \
	nixpkgs.trash-cli \
	nixpkgs.autojump \
	nixpkgs.cmatrix \
	nixpkgs.fzf \
	nixpkgs.ffmpeg \

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# Make Directories
mkdir $HOME/.cache
mkdir $HOME/.cache/zsh
touch $HOME/.cache/zsh/history