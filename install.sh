#!/bin/bash
export SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

echo "Determining OS version..."
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi

echo "Installing for os: $OS  version: $VER"

if [ "$OS" == "Fedora" ]; then
    dnf install -y \
        cmake gcc gcc-c++ git jq mutt the_silver_searcher tmux vim
elif [ "$OS" == "Ubuntu" ]; then
    apt update
    apt install -y \
        cmake g++ git jq mutt silversearcher-ag tmux vim
elif [ "$OS" == "Darwin" ]; then
    brew install cmake fzf jq mutt the_silver_searcher tmux trash vault
    brew cask install firefox iterm2 google-chrome spotify
else
    echo "Operating system: $OS not recognized :("
fi
