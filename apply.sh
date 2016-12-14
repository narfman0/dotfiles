#!/bin/bash
export SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
echo 'Linking scripts to ' $SCRIPTPATH
pushd ~

if ! grep bash_common .bashrc; then
  echo . $SCRIPTPATH/.bash_common >> .bashrc
fi

mkdir -p .local/bin

mv .vimrc .vimrc.old
ln -fs $SCRIPTPATH/.vimrc

mv .conkyrc .conkyrc.old
ln -fs $SCRIPTPATH/.conkyrc

mkdir -p .tmux
ln -fs $SCRIPTPATH/.tmux.conf
ln -fs $SCRIPTPATH/.tmuxdev -T .local/bin/tmuxdev

ln -fs $SCRIPTPATH/.irssi

popd
