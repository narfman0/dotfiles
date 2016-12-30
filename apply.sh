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
mv .tmux.conf .tmux.conf.old
ln -fs $SCRIPTPATH/.tmux.conf

echo -n "What is your ZNC password (for irssi)? "
read -s znc_pass
mv ~/.irssi ~/.irssi.old
mkdir -p ~/.irssi
ln -fs $SCRIPTPATH/.irssi/scripts ~/.irssi/
ln -fs $SCRIPTPATH/.irssi/weed.theme ~/.irssi/
ln -fs $SCRIPTPATH/.irssi/default.theme ~/.irssi/
cp $SCRIPTPATH/.irssi/config ~/.irssi/
sed -i -e "s/ZNC_PASS/$znc_pass/g" ~/.irssi/config

mkdir -p ~/.newsbeuter
ln -fs $SCRIPTPATH/.newsbeuter/urls ~/.newsbeuter/

popd
