pythoninit() {
    echo "Installing vim plugins"
    vim -E -s -u "~/.vimrc" +PluginInstall +qall
    pushd .vim/bundle/YouCompleteMe
    if [ ! -e "third_party/ycmd/ycm_core.so" ]; then
        echo "YCM not compiled, compiling"
        ./install.py
    else
        echo "YCM already compiling, skipping"
    fi
}
function cd(){
    builtin cd "${*}"
    if [ -e ".env" ]; then
        . .env
    fi
}
load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}
# Start a Claude Code session in a temporary, random Git worktree
claude-temp() {
    # 1. Ensure we are inside a Git repository
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Error: Not a git repository." >&2
        return 1
    fi

    # 2. Generate a random, short alphanumeric string for the worktree name
    local rand_suffix=$(head /dev/urandom | tr -dc 'a-z0-9' | head -c 6)
    local wt_name="temp-session-$rand_suffix"

    echo "🚀 Starting Claude Code in random worktree: $wt_name"

    # 3. Launch Claude Code using its native worktree behavior
    # Note: When you exit, Claude will natively prompt you to delete the folder.
    claude --worktree "$wt_name"
}
