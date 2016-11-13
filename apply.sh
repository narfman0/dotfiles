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

#pip install --user autoenv
if [ ! -f $HOME/.autoenv/activate.sh ]; then
    mkdir -p $HOME/.autoenv
    pushd $HOME/.autoenv
    wget https://raw.githubusercontent.com/kennethreitz/autoenv/master/activate.sh
popd
fi

popd
