#!/bin/bash

figlet "TK:Dotfiles"
echo $location
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

echo -e "\n\nCreating backups"
echo -e "Confirm the following backup commands:\n\n"
mkdir ~/backupDotfiles

ls -A ../current | xargs -i -p -n 1 -I {} cp ~/{} ~/backupDotfiles/{}                                            
echo -e  "\n\nDone backing up"
echo -e "Confirm the following symlinks to use TK:Dotfiles:\n\n"
ls -A ../current | xargs -n 1 -p -i  -I {} ln -f -sv ../current/{} ~/{}


echo -e "\n\nAll Set."
                                                
                                                
