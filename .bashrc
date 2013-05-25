# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# this function is not needed. function __git_ps1() should be available
#function parse_git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
#}

# Extra exports
if [ -f ~/.bash_exports ]; then
    . ~/.bash_exports
fi

# Added by autojump install.sh
# Load autojump
[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && source ~/.autojump/etc/profile.d/autojump.bash

function proml {
    # Reset
    local Color_Off="\[\033[0m\]"       # Text Reset

    # Regular Colors
    local Black="\[\033[0;30m\]"        # Black
    local Red="\[\033[0;31m\]"          # Red
    local Green="\[\033[0;32m\]"        # Green
    local Yellow="\[\033[0;33m\]"       # Yellow
    local Blue="\[\033[0;34m\]"         # Blue
    local Purple="\[\033[0;35m\]"       # Purple
    local Cyan="\[\033[0;36m\]"         # Cyan
    local White="\[\033[0;37m\]"        # White

    # Bold
    local BBlack="\[\033[1;30m\]"       # Black
    local BRed="\[\033[1;31m\]"         # Red
    local BGreen="\[\033[1;32m\]"       # Green
    local BYellow="\[\033[1;33m\]"      # Yellow
    local BBlue="\[\033[1;34m\]"        # Blue
    local BPurple="\[\033[1;35m\]"      # Purple
    local BCyan="\[\033[1;36m\]"        # Cyan
    local BWhite="\[\033[1;37m\]"       # White

    # Underline
    local UBlack="\[\033[4;30m\]"       # Black
    local URed="\[\033[4;31m\]"         # Red
    local UGreen="\[\033[4;32m\]"       # Green
    local UYellow="\[\033[4;33m\]"      # Yellow
    local UBlue="\[\033[4;34m\]"        # Blue
    local UPurple="\[\033[4;35m\]"      # Purple
    local UCyan="\[\033[4;36m\]"        # Cyan
    local UWhite="\[\033[4;37m\]"       # White

    # Background
    local On_Black="\[\033[40m\]"       # Black
    local On_Red="\[\033[41m\]"         # Red
    local On_Green="\[\033[42m\]"       # Green
    local On_Yellow="\[\033[43m\]"      # Yellow
    local On_Blue="\[\033[44m\]"        # Blue
    local On_Purple="\[\033[45m\]"      # Purple
    local On_Cyan="\[\033[46m\]"        # Cyan
    local On_White="\[\033[47m\]"       # White

    # High Intensty
    local IBlack="\[\033[0;90m\]"       # Black
    local IRed="\[\033[0;91m\]"         # Red
    local IGreen="\[\033[0;92m\]"       # Green
    local IYellow="\[\033[0;93m\]"      # Yellow
    local IBlue="\[\033[0;94m\]"        # Blue
    local IPurple="\[\033[0;95m\]"      # Purple
    local ICyan="\[\033[0;96m\]"        # Cyan
    local IWhite="\[\033[0;97m\]"       # White

    # Bold High Intensty
    local BIBlack="\[\033[1;90m\]"      # Black
    local BIRed="\[\033[1;91m\]"        # Red
    local BIGreen="\[\033[1;92m\]"      # Green
    local BIYellow="\[\033[1;93m\]"     # Yellow
    local BIBlue="\[\033[1;94m\]"       # Blue
    local BIPurple="\[\033[1;95m\]"     # Purple
    local BICyan="\[\033[1;96m\]"       # Cyan
    local BIWhite="\[\033[1;97m\]"      # White

    # High Intensty backgrounds
    local On_IBlack="\[\033[0;100m\]"   # Black
    local On_IRed="\[\033[0;101m\]"     # Red
    local On_IGreen="\[\033[0;102m\]"   # Green
    local On_IYellow="\[\033[0;103m\]"  # Yellow
    local On_IBlue="\[\033[0;104m\]"    # Blue
    local On_IPurple="\[\033[10;95m\]"  # Purple
    local On_ICyan="\[\033[0;106m\]"    # Cyan
    local On_IWhite="\[\033[0;107m\]"   # White

    # Various variables you might want for your PS1 prompt instead
    local pPathShort="\w"
    local pPathFull="\W"
    local pJobs="\j"
    local pUser="\u"
    local pHost="\h"
    local pUserAtHost="\u@\h"

    export PS1=$IBlack$pUserAtHost$Color_Off'$(git branch &>/dev/null;\
    if [ $? -eq 0 ]; then \
        echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
        if [ "$?" -eq "0" ]; then \
            # Clean repository - nothing to commit
            echo "'$Green'"$(__git_ps1 " (%s)"); \
        else \
            # Changes to working tree
            echo "'$IRed'"$(__git_ps1 " {%s}"); \
        fi) '$BYellow$pPathShort$Color_Off'\$ "; \
    else \
        # Prompt when not in GIT repo
        echo " '$Yellow$pPathShort$Color_Off'\$ "; \
    fi)'
}

proml

