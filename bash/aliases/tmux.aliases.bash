alias tsa='tmux attach-session'
alias tsk='tmux kill-session'
alias tsl='tmux list-sessions'
alias tsn='tmux new-session'
alias tsan='tmux attach-session -t newsbeuter'
alias tsai='tmux attach-session -t irssi'
alias tsa0='tmux attach-session -t 0'
alias tsa1='tmux attach-session -t 1'
alias tsa2='tmux attach-session -t 2'
alias tsni='tmux new-session -s irssi irssi'
alias tsnn='tmux new-session -s newsbeuter newsbeuter'
tsnd() {
    tmux new-session -d bash
    tmux split-window -v
    tmux resize-p -D 7
    tmux select-pane -U
    tmux send-keys 'sleep 1' Enter 'vim .' Enter
    tmux -2 attach-session -d
}
tsns() {
    tmux new-session -d bash
    tmux split-window -v
    tmux resize-p -D 7
    tmux select-pane -U
    tmux -2 attach-session -d
}
