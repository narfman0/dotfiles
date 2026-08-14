alias cddf='cd $DOTFILES_ROOT'
alias count='expr $(wc -l | tr -d '"'"'[:space:]'"'"') - 1'
alias ll='ls -FGlAhp'
alias lll='ll | count'
alias rf='find . 2> /dev/null | grep'
alias striphtml="sed 's|<[^>]*>||g'"
alias beep='echo -e "\a"'
alias rustup-init='curl --proto '"'"'=https'"'"' --tlsv1.2 -sSf https://sh.rustup.rs | sh'
alias cte='crontab -e'
alias agq='ag -q'
alias vim='nvim'
alias vimb='vim ~/.bashrc && source ~/.bashrc'
alias cdw='cd ~/workspace'
wex(){
  while :
  do
    $@
    sleep 1
  done
}

alias genpass="openssl rand -base64 20"
alias c='clear'
alias ipe='curl ipinfo.io/ip'
alias dice='dice.sh'
alias roll='dice'
dfcpo() {
  pushd $DOTFILES_ROOT
  git commit -am "incremental commit $(date +'%Y-%m-%d %H:%M:%S')"
  git push origin
  popd
}

if [ -x "$(command -v trash)" ]; then
    alias rm='trash'
fi
