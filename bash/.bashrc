# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion
source ~/.git-completion.sh

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
alias dmesg='dmesg -HL'
#
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias wget='wget --content-disposition'
#
# Some shortcuts for different directory listings
alias laa='/usr/bin/ls -ah --color=auto'
alias ls='ls -hB --color=auto'                # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and .. and *~
alias l='ls -C'                               #
alias sl='ls'

alias ff="find . -type f -name "

#alias k='ssh karma -Y'
#alias b='ssh boulder'
#alias n='ssh neenah'
#alias h='ssh hypatia'
#alias dv='ssh dvlin'
#alias ss='ssh superserver'
#alias nk='ssh 172.21.249.234'
#alias nola='ssh nola'
#alias mg4='ssh mgmt4'
alias yoda='ssh yoda -Y'
alias lando='ssh lando -Y'
alias hokie='ssh hokie -Y'
alias zed1='ssh zed1 -Y'
alias zed2='ssh zed2'
alias dv='ssh dvdevel1'
alias sc='ssh scdevel1'

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

#--------------------------------------------------------------
#  Automatic setting of $DISPLAY (if not set already).
#  This works for me - your mileage may vary. . . .
#  The problem is that different types of terminals give
#+ different answers to 'who am i' (rxvt in particular can be
#+ troublesome) - however this code seems to work in a majority
#+ of cases.
#--------------------------------------------------------------

function get_xserver ()
{
    case $TERM in
        xterm )
            XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
            # Ane-Pieter Wieringa suggests the following alternative:
            #  I_AM=$(who am i)
            #  SERVER=${I_AM#*(}
            #  SERVER=${SERVER%*)}
            XSERVER=${XSERVER%%:*}
            ;;
            aterm | rxvt)
            # Find some code that works here. ...
            ;;
    esac
}

if [ -z ${DISPLAY:=""} ]; then
    get_xserver
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) ||
       ${XSERVER} == "unix" ]]; then
          DISPLAY=":0.0"          # Display on local host.
    else
       DISPLAY=${XSERVER}:0.0     # Display on remote host.
    fi
fi

export DISPLAY

function set_titlebar {
    case $TERM in
        *xterm*|ansi|rxvt|*screen*)
            printf "\033]0;%s\007" "$*"
            ;;
    esac
}

function get_dir() {
    printf "%s" $(pwd | sed "s:$HOME:~:")
}

source ~/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "; set_titlebar "$USER@${HOSTNAME%%.*} $(get_dir)"'
GIT_PS1_SHOWCOLORHINTS=1
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

eval `dircolors ~/.dircolors`

export EDITOR=vim

#disable XON/XOFF so I can i-search
stty -ixon

# source the local bashrc if it exists
if [ -f "${HOME}/.bashrc_local" ] ; then
  source "${HOME}/.bashrc_local"
fi

export LYNX_LSS=${HOME}/.lynx.lss

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
