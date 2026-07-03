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
load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}
