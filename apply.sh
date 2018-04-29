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
rsync -avz $SCRIPTPATH/.vim/colors/*.vim .vim/colors
rsync -avz $SCRIPTPATH/.vim/plugin/*.vim .vim/plugin

mv .conkyrc .conkyrc.old
ln -fs $SCRIPTPATH/.conkyrc

mkdir -p .tmux
mv .tmux.conf .tmux.conf.old
ln -fs $SCRIPTPATH/.tmux.conf

if [ -z "$ZNC_PASS" ]; then
  echo -n "What is your ZNC password (for irssi)? "
  read -s ZNC_PASS
  echo "export ZNC_PASS=$ZNC_PASS" >> ~/.bashrc
fi
rm -rf ~/.irssi.old
mv ~/.irssi ~/.irssi.old
mkdir -p ~/.irssi
ln -fs $SCRIPTPATH/.irssi/scripts ~/.irssi/
ln -fs $SCRIPTPATH/.irssi/weed.theme ~/.irssi/
ln -fs $SCRIPTPATH/.irssi/default.theme ~/.irssi/
cp $SCRIPTPATH/.irssi/config ~/.irssi/
sed -i -e "s/ZNC_PASS/$ZNC_PASS/g" ~/.irssi/config

mkdir -p ~/.newsbeuter
ln -fs $SCRIPTPATH/.newsbeuter/urls ~/.newsbeuter/
ln -fs $SCRIPTPATH/.newsbeuter/config ~/.newsbeuter/

popd
