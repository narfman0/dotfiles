newsbeuterpurge() {
    sqlite3 -line ~/.newsbeuter/cache.db "DELETE FROM rss_item WHERE unread = 1 AND pubDate < ( SELECT strftime('%s','now') - (10*86400));"
}
osxaslclean() {
    sudo mv /private/var/log/asl/*.asl ~/.Trash
}
function cd(){
    builtin cd "${*}"
    if [ -e ".env" ]; then
        . .env
    fi
}
