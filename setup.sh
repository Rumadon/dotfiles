#!/bin/sh
#bomb out if error
set -e

echo "Installing Homebrew packages..."
brew update
brew tap homebrew/bundle
brew bundle
for brewfile in ~/.dotfiles/*/Brewfile; do
  echo brewfile
 brew bundle --verbose --file="$brewfile"
done

# Find all dot-specific setup files and source them
#for setup in dot-*/setup; do
#  . "$setup"
#done

./install/create-symlinks.sh
