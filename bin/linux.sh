#!/bin/bash
#check the operating system type is "Linux"

#Append any output from statements to linuxsetup.log
exec >> linuxsetup.log 2>&1

#if-else statement if uname doesn't equal Linux, then dump an error code and exit.
if (( $uname != "Linux" )); then
	echo "Error"
	exit 1
fi

#make a .TRASH directory in home directory
mkdir -p ~/.TRASH

#change .vimrc to .bup_vimrc
if (( -f ~/.vimrc )); then
	mv ~/.vimrc ~/.bup_vimrc
	echo ".vimrc changed to '.bup_vimrc'"
fi

#Overwrite the contents of etc/vimcr file to a called .vimrc to home directory
cp ./etc/vimrc ~/.vimrc

#Add this statement to the end of the .bashrc file in home directory
echo "source ~/.dotfiles/etc/bashrc_custom" >> ~/.bashrc
