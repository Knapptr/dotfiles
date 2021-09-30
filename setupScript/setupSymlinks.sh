#!/bin/bash
DOTFILE="$(dirname "$(realpath "$0")")"
DOTFILE="$(dirname $DOTFILE)"
DOTFILE+="/current"
TARGET_DIR="$HOME"

clear
figlet "TK:Dotfiles"
echo "Would you like to setup symlinks for dotfiles on the home directory? (~/)";
echo "y/n:";
while true
do
	read yn
	case $yn in
		[Yy]* )break;;  
		[Nn]* ) exit;;
	esac
	echo "You must answer y(es) or n(o)";
	echo "y/n:";
done
cd $DOTFILE/../current
echo -e "\n\nCreating backups"
echo -e "Confirm the following backup commands:\n\n"
mkdir ~/backupDotfiles

ls -A $DOTFILE | xargs -i -p -n 1 -I {} cp $HOME/{} $HOME/backupDotfiles/{}                                            
echo -e  "\n\nDone backing up"
echo -e "Confirm the following symlinks to use TK:Dotfiles:\n\n"
ls -A $DOTFILE | xargs -n 1 -p -i  -I {} ln -svif $DOTFILE/{} $HOME/{}


echo -e "\n\nAll Set."
                                                
                                                
