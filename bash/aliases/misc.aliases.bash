alias cddf='cd $DOTFILES_ROOT'
alias count='expr $(wc -l | tr -d '"'"'[:space:]'"'"') - 1'
alias ll='ls -FGlAhp'
alias lll='ll | count'
alias rf='find . 2> /dev/null | grep'
alias striphtml="sed 's|<[^>]*>||g'"
alias pt='python -m unittest discover'
alias ampc='cp $1 `grep UUID -A1 -a $1 | grep -io "[-A-Z0-9]\{36\}"`'
alias beep='echo -e "\a"'
alias rustup-init='curl --proto '"'"'=https'"'"' --tlsv1.2 -sSf https://sh.rustup.rs | sh'
alias cte='crontab -e'
alias agq='ag -q'
alias vim='nvim'
alias vimb='vim ~/.bashrc'
alias vimbs='vim ~/.bashrc && source ~/.bashrc'
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
#alias agr='ag "$1" --nogroup | awk '{print substr($1,1,index($1,":")-1);}' | xargs -I {} sed -i '.back' -e "s/$1/$2/g" {}'
alias dice='dice.sh'
alias roll='dice'

if [ -x "$(command -v trash)" ]; then
    alias rm='trash'
fi
