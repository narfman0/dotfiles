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

Install via install script::

   sudo ./install.sh

Usage
-----

Primarily, tmux and vim have been configured and a command `td` has been
added to the PATH which will start a tmux session with vim and two
terminals. To edit files in a project (python etc) type::

    td

Normal tmux movement with ctrl-a -> action is supported.

Irssi has been configured and is easily accessible with::

    ti

Newsbeuter can be loaded with::

    tn

There are a few bash shortcuts to reopen old stuff, add 'a' for attach::

    # tmux newsbeuter attach
    tna
    # tmux irssi attach
    tia
    # tmux generic attach 'whatever'
    ta
