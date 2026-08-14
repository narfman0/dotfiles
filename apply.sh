#!/bin/bash
export SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
echo 'Linking scripts to ' $SCRIPTPATH
pushd ~

if ! grep bash_common .bashrc; then
  echo . $SCRIPTPATH/.bash_common >> .bashrc
fi

mv .vimrc .vimrc.old
ln -fs $SCRIPTPATH/.vimrc
mkdir -p .vim/colors

mv .gitignore_global .gitignore_global.bak
ln -fs $SCRIPTPATH/.gitignore_global

mkdir -p .tmux
mv .tmux.conf .tmux.conf.old
ln -fs $SCRIPTPATH/.tmux.conf

popd

. $HOME/.bashrc
