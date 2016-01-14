#! /bin/bash
dotdir=`pwd`
olddotdir=$dotdir/old_dotfiles
files=`ls -d .??*`

echo "Creating $olddotdir to backup existing dotfiles"
mkdir -p $olddotdir

for file in $files
do
	mv ~/$file $olddotdir &> /dev/null
	echo "Creating symlink to $file in home directory."
	ln -s $dotdir/$file ~/$file
done

source ~/.bashrc

