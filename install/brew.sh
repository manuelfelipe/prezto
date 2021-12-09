#!/bin/bash

# src: https://github.com/nicksp/dotfiles/blob/master/install/brew.sh
# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap homebrew/dupes

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

apps=(
    coreutils
    moreutils
    findutils
    ffmpeg
    git
    gnu-sed --with-default-names
    grep --with-default-names
    homebrew/completions/brew-cask-completion
    mtr
    tree
    ffmpeg --with-libvpx
    wget
    google-cloud-sdk
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
