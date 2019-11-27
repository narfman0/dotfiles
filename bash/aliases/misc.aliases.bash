alias ll='ls -FGlAhp'
alias lll='expr $(ll | wc -l | tr -d '"'"'[:space:]'"'"') - 1'
alias rf='find . 2> /dev/null | grep'
alias striphtml="sed 's|<[^>]*>||g'"
alias pt='python -m unittest discover'
alias ampc='cp $1 `grep UUID -A1 -a $1 | grep -io "[-A-Z0-9]\{36\}"`'
alias beep='echo -e "\a"'
alias t='task'
alias rustup-init='curl --proto '"'"'=https'"'"' --tlsv1.2 -sSf https://sh.rustup.rs | sh'

alias genpass="openssl rand -base64 20"
alias c='clear'
alias ipe='curl ipinfo.io/ip'
#alias agr='ag "$1" --nogroup | awk '{print substr($1,1,index($1,":")-1);}' | xargs -I {} sed -i '.back' -e "s/$1/$2/g" {}'
alias dice='dice.sh'
alias roll='dice'

# in case i forget to remove these from bash-it cp bash aliases
alias cite='false'
alias about-alias='false'

if [ -x "$(command -v trash)" ]; then
    alias rm='trash'
fi
