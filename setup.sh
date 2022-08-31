#!/bin/sh
#bomb out if error
set -e

echo "Installing Homebrew packages..."

{
    brew update
} || {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew update
}
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

./install/download-tools.sh
./install/create-symlinks.sh
