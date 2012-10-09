# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."

# Easier file & directory listing
alias l='ls -CF'  # directories and files in columns
alias la='ls -A'  # directories and files incl. hidden in columns
alias ll='ls -alF'  # everything with extra info as a list
alias lsd='ls -l | grep "^d"'  # only directories as a list
alias ls="command ls -G --color" # always use color output for 'ls'

# Shortcuts
alias w="cd ~/work"
alias c="clear"
alias v="vim"
alias tm="tmuxgo.sh"
alias mj='make -j50 -l90'
alias g='git'
