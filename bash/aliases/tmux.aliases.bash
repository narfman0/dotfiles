alias tsa='tmux attach-session'
alias tsk='tmux kill-session'
alias tsl='tmux list-sessions'
alias tsn='tmux new-session'
alias tsat='tmux attach-session -t'
alias tsan='tmux attach-session -t newsbeuter'
alias tsai='tmux attach-session -t irssi'
alias tsa0='tmux attach-session -t 0'
alias tsa1='tmux attach-session -t 1'
alias tsa2='tmux attach-session -t 2'
alias tsa3='tmux attach-session -t 3'
alias tsa4='tmux attach-session -t 4'
alias tsa5='tmux attach-session -t 5'
alias tsa6='tmux attach-session -t 6'
alias tsa7='tmux attach-session -t 7'
alias tsa8='tmux attach-session -t 8'
alias tsa9='tmux attach-session -t 9'
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
