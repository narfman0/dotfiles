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
git config pull.rebase false

mkdir -p .tmux
mv .tmux.conf .tmux.conf.old
ln -fs $SCRIPTPATH/.tmux.conf

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

ln -fs $SCRIPTPATH/.ctags

echo "Installing vim plugins"
vim -E -s -u "~/.vimrc" +PluginInstall +qall
pushd .vim/bundle/YouCompleteMe
if [ ! -e "third_party/ycmd/ycm_core.so" ]; then
    echo "YCM not compiled, compiling"
    ./install.py
else
    echo "YCM already compiling, skipping"
fi
popd

[ ! -d "$HOME/.pyenv" ] && curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
[ ! -d "$HOME/.nvm" ] && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
[ ! -d "$HOME/.poetry" ] && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

# ruby
if [ ! -d "$HOME/.rvm" ]; then
    curl -sSL https://get.rvm.io | bash -s stable --rails
    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
fi
[ ! -f $HOME/.rvmrc ] && touch $HOME/.rvmrc
if ! grep rvm_silence $HOME/.rvmrc; then
    echo "rvm_silence_path_mismatch_check_flag=1" >> ~/.rvmrc
fi

popd

. $HOME/.bashrc
