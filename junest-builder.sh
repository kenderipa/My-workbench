#!/bin/sh

# SET APPDIR AS A TEMPORARY $HOME DIRECTORY, THIS WILL DO ALL WORK INTO THE APPDIR
HOME="$(dirname "$(readlink -f $0)")" 

# DOWNLOAD AND INSTALL JUNEST (DON'T TOUCH THIS)
git clone https://github.com/fsquillace/junest.git ~/.local/share/junest
./.local/share/junest/bin/junest setup

# UPDATE ARCH LINUX IN JUNEST
./.local/share/junest/bin/junest -- sudo pacman -Syy
./.local/share/junest/bin/junest -- sudo pacman --noconfirm -Syu
echo yes | ./.local/share/junest/bin/junest -- sudo pacman -Scc
