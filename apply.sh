#!/bin/bash
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
pushd ~
mv .bash_profile .bash_profile.old
ln $(SCRIPTPATH)/.bash_profile
mv .vimrc .vimrc.old
ln $(SCRIPTPATH)/.vimrc
mv .conkyrc .conkyrc.old
ln $(SCRIPTPATH)/.conkyrc
popd
