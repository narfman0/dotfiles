newsbeuterpurge() {
    sqlite3 -line ~/.newsbeuter/cache.db "DELETE FROM rss_item WHERE unread = 1 AND pubDate < ( SELECT strftime('%s','now') - (10*86400));"
}
osxaslclean() {
    sudo mv /private/var/log/asl/*.asl ~/.Trash
}
pythoninit() {
    echo "Installing vim plugins"
    vim -E -s -u "~/.vimrc" +PluginInstall +qall
    pushd .vim/bundle/YouCompleteMe
    if [ ! -e "third_party/ycmd/ycm_core.so" ]; then
        echo "YCM not compiled, compiling"
        ./install.py
    else
        echo "YCM already compiling, skipping"
    fi
}
function cd(){
    builtin cd "${*}"
    if [ -e ".env" ]; then
        . .env
    fi
}
