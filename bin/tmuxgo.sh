#!/bin/sh
# Start a named tmux session (or attach, if exist)
# If no name is specified, use 0

if [ -n "$1" ]; then
    SESSION=$1
else
    SESSION=0
fi

tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
    echo "Session exists. Attaching."
    sleep 1
    tmux attach -t $SESSION
    exit 0;
fi


tmux new-session -d -n "runserver" -s $SESSION

#tmux new-window -t $SESSION:1 -n "run tests"
#tmux new-window -t $SESSION:2 -n "vim tests" 'vim'
#tmux new-window -t $SESSION:3 -n "vim code" 'vim'
#tmux new-window -t $SESSION:4 -n "view source"

tmux attach -t $SESSION
