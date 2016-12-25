========
dotfiles
========

Some system, editor, or other configuration file I want shared or otherwise
accessible

Installation
------------

Clone this repository, navigate to it, and, run::

    ./apply.sh

This will back up and apply all dotfiles and symbolically link, copy, or
otherwise apply what settings are desired. Likely used in conjunction
with an ansible script for installing ```vim tmux irssi```

Linux (dmf/rpm based)::

    sudo dnf install vim tmux irssi conky -y

OSX::

    brew install vim-nox tmux irssi

Usage
-----

Primarily, tmux and vim have been configured and a command `td` has been
added to the PATH which will start a tmux session with vim and two
terminals. To edit files in a project (python etc) type::

    td

Normal tmux movement with ctrl-a -> action is supported.

Irssi has been configured and is easily accessible with::

    ti
