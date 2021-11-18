# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

export PATH="/home/heshan/src/cmake/cmake-3.20.0/bin/:$PATH"
export PATH="$PATH:/data/heshan/bin/emacs/bin/"
export PATH="$PATH:/data/heshan/bin/global/bin"
# export PATH="/home/heshan/anaconda3/bin:$PATH"  # commented out by conda initialize

export TERM=xterm-256color

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## get rid of command not found ##
alias cd..='cd ..' 
 
## a quick way to get out of current directory ##
alias ..='cd ..' 
alias ...='cd ../../../' 
alias ....='cd ../../../../' 
alias .....='cd ../../../../' 
alias .4='cd ../../../../' 
alias .5='cd ../../../../..'


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export GTAGSFORCECPP=""

export RMODEL_PATH="/data/heshan/model/rmodel/"

# read -p "enter beetle mode(curr): " mode
export BEETLE_PATH="/data/heshan/Beetle/"
export PATH="$PATH:/data/heshan/Beetle/project/build/"
# if [ -n "$mode" ] && [ "$mode" = 'curr' ]
# then
# fi
echo "BEETLE_PATH: $BEETLE_PATH"

export FEATURE_MODEL="/data/heshan/models/feature_246.2/"
export ALIGNER_MODEL="/data/heshan/models/alignment/"
export CLASSIFY_MODEL="/data/heshan/models/attribute_classify/"
export BLUR_MODEL="/data/heshan/models/blur/"
export BLUR6_MODEL="/data/heshan/models/blur.6.0.0/"
export SMALLFACE_MODEL="/data/heshan/models/KM_Hunter_SmallFace_Gray_4.8.0/proposal_final/"
export HEADPOS_MODEL="/data/heshan/models/headpose/"

export FEATURE_248_2_MODEL="/data/heshan/models/model/common/feature.248.2/"
export ALIGNER_DEEP_FACE_MODEL="/data/heshan/models/model/common/aligner.new/aligner_new/KM_Aligner_DeepFace_ppl_2.17.2/model"
export ALIGNER_2_MODEL="/data/heshan/models/model/common/aligner.new/aligner_new/KM_Aligner_ppl_1.0.0/model"
export CLASSIFY_2_MODEL="/data/heshan/models/model/common/attribute2/model"

export ALIGNER_MODEL_2_17_2="/data/heshan/models/model/common/KM_Aligner_DeepFace_ppl_2.17.2"
export ALIGNER_MODEL_1_9_6="/data/heshan/models/model/face_2.9.6/alignment/alignment"
export CLASSIFY_MODEL_1_9_6="/data/heshan/models/model/face_1.9.6/attribute/model"
export BLUR_MODEL_1_9_6="/data/heshan/models/work/face_1.9.6/blur/model"
export SMALLFACE_MODEL_1_9_6="/data/heshan/models/model/common/face_1.9.6/detection/proposal_final"
export LARGEFACE_MODEL_1_9_6="/data/heshan/models/model/face_1.9.6/detection/largeface/model"
export HEADPOS_MODEL_1_9_6="/home/heshan/src/work/face_1.9.6/headpose/model"
export DETECT_COMMON_1_9_6="/home/heshan/src/work/face_1.9.6/detection/detect_common/model"

export STRUCT_MODEL="/data/heshan/models/model/structural"

export TESTBASE="/data/heshan/testrepo/ToolChain"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/home/heshan/anaconda3/lib/"

alias datestr='date "+%Y-%m-%d-%H-%M"'
alias vncstart='vncserver -geometry 1920x1080 :37'
alias vncstop='vncserver -kill :37'
alias ssh_test_board='ssh sensetime@10.4.70.22'
# 10.4.70.22
export sensetime_pc='sensetime@10.155.142.31'

cpnfs() {
    cp -r "$1" "/nfs54/project/spiderman/heshan/$1"
    echo "/nfs54/project/spiderman/heshan/$1"
}

tarbz2() {
    tar -cjvf $1.tar.bz2 $1
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/heshan/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/heshan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/heshan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/heshan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export TERM='xterm'

if [[ $- =~ "i" ]] && [ "$TERM_PROGRAM" != "iTerm.app" ]; then
    if command -v tmux >/dev/null 2>&1; then
        [[ -z "$TMUX" ]] && [ $HOSTNAME == h33 ] && exec tmux -2 new-session -A -s main
    fi
    ## eval `dircolors ~/.dircolors-solarized/dircolors.ansi-dark`
fi

# export PATH=/home/heshan/src/cmake/cmake-3.20.0/bin:$PATH
# GCC10=/home/heshan/src/gcc/gcc10
# export PATH=$GCC10/bin:$GCC10/lib64:$PATH
# export LD_LIBRARY_PATH=$GCC10/lib/:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$GCC10/lib64/:$LD_LIBRARY_PATH
# export C_INCLUDE_PATH=$C_INCLUDE_PATH:$GCC10/include
# export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$GCC10/include
# export LIBRARY_PATH=$LIBRARY_PATH:$GCC10/lib
