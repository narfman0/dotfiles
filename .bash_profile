if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
export PATH=$HOME/.local/bin:$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:$PATH
alias ll='ls -FGlAhp'
alias rg='grep -r --exclude-dir *.git --exclude *tags'
alias vu='USER=jrobison vagrant up && vagrant ssh'
alias rf='find . 2> /dev/null | grep'
alias gr='git fetch; git rebase -i origin/master'
alias striphtml="sed 's|<[^>]*>||g'"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="[\u@\h \w]$ "
export EDITOR=vim
export NSS_SSL_CBC_RANDOM_IV=0
