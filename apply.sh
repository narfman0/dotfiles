#!/bin/bash
export SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
echo 'Linking scripts to ' $SCRIPTPATH
pushd ~

echo . $SCRIPTPATH/.bash_common >> .bashrc

mv .vimrc .vimrc.old
ln $SCRIPTPATH/.vimrc

mv .conkyrc .conkyrc.old
ln $SCRIPTPATH/.conkyrc

mkdir -p .tmux
ln $SCRIPTPATH/.tmux.conf

popd
