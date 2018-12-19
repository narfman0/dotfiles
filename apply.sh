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

mv .conkyrc .conkyrc.old
ln -fs $SCRIPTPATH/.conkyrc

mv .gitignore_global .gitignore_global.bak
ln -fs $SCRIPTPATH/.gitignore_global

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

if [ ! -f ~/.git-completion.bash ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

if [ ! -f ~/.tmux-completion.bash ]; then
  curl https://raw.githubusercontent.com/narfman0/tmux-bash-completion/master/completions/tmux -o ~/.tmux-completion.bash
fi

if [ ! -f ~/.vault-completion.bash ]; then
  curl https://raw.githubusercontent.com/narfman0/bash-it/master/completion/available/vault.completion.bash -o ~/.vault-completion.bash
fi

git config --global user.email "narfman0@gmail.com"
git config --global user.name "Jon Robison"
git config --global core.excludesfile ~/.gitignore_global

popd
