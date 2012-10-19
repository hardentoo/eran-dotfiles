# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{profile,bash_extra,bash_prompt,bash_exports,bash_aliases,bash_functions,bash_completion}; do
    [ -r "$file" ] && source "$file"
done
unset file


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh


# Added by autojump install.sh
# Load autojump
[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && source ~/.autojump/etc/profile.d/autojump.bash


# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace


# append to the history file, don't overwrite it
shopt -s histappend


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# this function is not needed. function __git_ps1() should be available
#function parse_git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
#}

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

  #local BLUE="\[\033[0;34m\]"
  #local RED="\[\033[0;31m\]"
  #local LIGHT_RED="\[\033[1;31m\]"
  #local GREEN="\[\033[0;32m\]"
  #local LIGHT_GREEN="\[\033[1;32m\]"
  #local WHITE="\[\033[1;37m\]"
  #local LIGHT_GRAY="\[\033[0;37m\]"
  #local YELLOW="\[\033[0;33m\]"
  #local DEFAULT="\[\033[0m\]"
  #PS1="$LIGHT_RED\u@\h: $DEFAULT\w $YELLOW\$(parse_git_branch)$DEFAULT\$ "
  #PS1="[$LIGHT_RED\u@\h$YELLOW$(__git_ps1)$DEFAULT:\w]\$ $DEFAULT"
}

proml
