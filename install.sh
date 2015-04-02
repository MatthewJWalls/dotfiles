#!/bin/bash

#
# Installs Dotfiles
#

# prechecks

echo -ne "Git username: "
read gituser
echo -ne "Git email: "
read gitemail

BASE=$HOME/.mjwdotfiles

rm -rf $BASE
mkdir $BASE

# move out the home files

for file in home/*; do
    echo "moving $file to $HOME."
    cp $file $HOME/.$(basename $file)
done

# move out the subfiles

for file in mjwdotfiles/*; do
    echo "moving $file to $BASE."
    cp $file $BASE/
done

# update git credentials

sed -i "s/GITNAME/$gituser/" ~/.gitconfig
sed -i "s/GITEMAIL/$gitemail/" ~/.gitconfig

# tell .bashrc to source my bash

if [[ "$(grep mjwdotfiles ~/.bashrc)" == "" ]]; then
    echo "updating .bashrc"
    echo "source $BASE/bash" >> ~/.bashrc
fi


