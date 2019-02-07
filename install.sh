#!/bin/bash
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
    dnf install -y vim cmake gcc gcc-g++ git irssi mutt python-devel python3-devel sshfs the_silver_searcher tmux
elif [ "$OS" == "Ubuntu" ]; then
    apt update
    apt install -y cmake g++ git mutt python-dev python3-dev sshfs the_silver_searcher tmux vim
elif [ "$OS" == "OSX" ]; then
    echo "Note: unsure if the OS switch above works"
    if ! [ -x "$(command -v brew)" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # required before sshfs
    brew cask install osxfuse
    brew install vim-nox --with-override-system-vi
    brew install cmake mutt pipenv pyenv python3 sshfs terraform vault
    brew cask install intellij-ce visual-studio-code firefox google-chrome
else
    echo "Operating system: $OS not recognized :("
fi
