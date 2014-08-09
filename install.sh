#!/bin/bash

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

# tell .bashrc to source my bash

if [[ "$(grep mjwdotfiles ~/.bashrc)" == "" ]]; then
    echo "updating .bashrc"
    echo "source $BASE/bash" >> ~/.bashrc
fi
