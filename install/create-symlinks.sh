#!/bin/zsh
CURRENT_DIR="$PWD"
# Remove old dot flies
echo -n "Remove old dot flies? (y/N) => "; read removedot
if [[ $removedot = "y" ]] || [[ $removedot = "Y" ]] ; then
  sudo rm -rf ~/.bashrc > /dev/null 2>&1
  sudo rm -rf ~/.zshrc > /dev/null 2>&1
  sudo rm -rf ~/.gitconfig > /dev/null 2>&1
#sudo rm -rf ~/.vim > /dev/null 2>&1
#sudo rm -rf ~/.vimrc > /dev/null 2>&1

#sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1


#sudo rm -rf ~/.config > /dev/null 2>&1
fi

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
echo "Creating symlinks in the home folder"
ln -sf $CURRENT_DIR/dot-vim ~/.vim
ln -sf $CURRENT_DIR/dot-vimrc ~/.vimrc
ln -sf $CURRENT_DIR/dot-bash/bashrc ~/.bashrc
ln -sf $CURRENT_DIR/dot-git/gitconfig ~/.gitconfig
ln -sf $CURRENT_DIR/dot-git/gitignore ~/.gitignore
ln -sf $CURRENT_DIR/dot-git/gitignore_global ~/.gitignore_global
# ln -sf $CURRENT_DIR/dot-zsh/zsh_prompt ~/.zsh_prompt
ln -sf $CURRENT_DIR/dot-zsh/zshrc ~/.zshrc
ln -sf $CURRENT_DIR/dot-config ~/.config


#==============
# Set zsh as the default shell
#==============
chsh -s /bin/zsh

#==============
# And we are done
#==============
echo -e "Finished!"
