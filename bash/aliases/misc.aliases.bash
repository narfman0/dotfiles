alias ll='ls -FGlAhp'
alias rf='find . 2> /dev/null | grep'
alias striphtml="sed 's|<[^>]*>||g'"
alias pt='python -m unittest discover'
alias ampc='cp $1 `grep UUID -A1 -a $1 | grep -io "[-A-Z0-9]\{36\}"`'
alias beep='echo -e "\a"'
alias t='task next'

alias grom='git fetch; git rebase -i origin/master'
alias grod='git fetch; git rebase -i origin/develop'
alias gru='git fetch upstream; git rebase -i upstream/master'
alias gri='git rebase -i'
alias grc='git rebase --continue'

alias filebot='filebot.sh -rename --db TheTVDB -non-strict --format "{n} - {s00e00} - {t}"'
alias filebotAnime='filebot.sh -rename --db anidb -non-strict --format "{n} - {s00e00} - {t}"'
alias filebotTest='filebot.sh -rename --db TheTVDB -non-strict --format "{n} - {s00e00} - {t}" --action test'

alias genpass="openssl rand -base64 20"
alias c='clear'
alias ipe='curl ipinfo.io/ip'
#alias agr='ag "$1" --nogroup | awk '{print substr($1,1,index($1,":")-1);}' | xargs -I {} sed -i '.back' -e "s/$1/$2/g" {}'
alias dice='dice.sh'
alias roll='dice'

alias mvnd='mvn deploy'
alias mvndst='mvnd -Dmaven.test.skip=true'
alias mvnt='mvn test'
alias mvnv='mvn verify'

# in case i forget to remove these from bash-it cp bash aliases
alias cite='false'
alias about-alias='false'

if [ -x "$(command -v trash)" ]; then
    alias rm='trash'
fi
