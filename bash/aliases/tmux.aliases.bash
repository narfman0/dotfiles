alias tas='tmux attach-session'
alias tks='tmux kill-session'
alias tia='tmux attach-session -t irssi'
alias tls='tmux list-sessions'
alias tn='tmux new-session -s newsbeuter newsbeuter'
alias tna='tmux attach-session -t newsbeuter'
ti() {
    tmux new-session -s irssi irssi
}
td() {
    tmux new-session -d bash
    tmux split-window -v
    tmux resize-p -D 7
    tmux select-pane -U
    tmux send-keys 'sleep 1' Enter 'vim .' Enter
    tmux -2 attach-session -d
}
tds() {
    tmux new-session -d bash
    tmux split-window -v
    tmux resize-p -D 7
    tmux select-pane -U
    tmux -2 attach-session -d
}
