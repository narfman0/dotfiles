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
        cmake conky gcc gcc-c++ git irssi jq mutt \
        python-devel python3-devel \
        snapd sshfs the_silver_searcher tmux vim
    ln -s /var/lib/snapd/snap /usr/bin/snap
    snap install spotify
elif [ "$OS" == "Ubuntu" ]; then
    apt update
    apt install -y \
        cmake conky g++ git jq mutt \
        python-dev python3-dev python3-pip python3-venv \
        snapd sshfs silversearcher-ag tmux vim
    snap install spotify
elif [ "$OS" == "Darwin" ]; then
    if ! [ -x "$(command -v brew)" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # required before sshfs
    brew cask install osxfuse
    brew install vim-nox --with-override-system-vi
    brew install cmake fzf jq lastpass-cli mutt sshfs terraform the_silver_searcher task tmux trash vault
    brew cask install intellij-idea-ce visual-studio-code firefox iterm2 google-chrome spectacle spotify
else
    echo "Operating system: $OS not recognized :("
fi

$SCRIPTPATH/bin/install-vscode-extensions.sh
