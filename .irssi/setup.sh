export SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
rm -rf ~/.irssi.old
mv ~/.irssi ~/.irssi.old
mkdir -p ~/.irssi
ln -fs $SCRIPTPATH//scripts ~/.irssi/
ln -fs $SCRIPTPATH//weed.theme ~/.irssi/
ln -fs $SCRIPTPATH/default.theme ~/.irssi/
cp $SCRIPTPATH/config ~/.irssi/
sed -i -e "s/ZNC_PASS/$ZNC_PASS/g" ~/.irssi/config