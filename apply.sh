#!/bin/bash
export SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
echo 'Linking scripts to ' $SCRIPTPATH
pushd ~

if ! grep bash_common .bashrc; then
  echo . $SCRIPTPATH/.bash_common >> .bashrc
fi

mv .vimrc .vimrc.old
ln -fs $SCRIPTPATH/.vimrc

mv .conkyrc .conkyrc.old
ln -fs $SCRIPTPATH/.conkyrc

mkdir -p .tmux
ln -fs $SCRIPTPATH/.tmux.conf

echo -n "What is your ZNC password (for irssi)? "
read -s znc_pass
mkdir -p ~/.irssi
ln -fs $SCRIPTPATH/.irssi/scripts ~/.irssi/
ln -fs $SCRIPTPATH/.irssi/weed.theme ~/.irssi/
cp $SCRIPTPATH/.irssi/config ~/.irssi/
sed -i -e "s/ZNC_PASS/$znc_pass/g" ~/.irssi/config

popd
