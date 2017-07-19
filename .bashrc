if [[ $- =~ "i" ]] && [ "$TERM_PROGRAM" != "iTerm.app" ]; then
    if command -v tmux >/dev/null 2>&1; then
        [[ -z "$TMUX" ]] && exec tmux new-session -A -s main
    fi
    eval `dircolors ~/.dircolors-solarized/dircolors.ansi-dark`

    # alias rm='rm -i'
    alias df='df -h'

    ## get rid of command not found ##
    alias cd..='cd ..' 
     
    ## a quick way to get out of current directory ##
    alias ..='cd ..' 
    alias ...='cd ../../../' 
    alias ....='cd ../../../../' 
    alias .....='cd ../../../../' 
    alias .4='cd ../../../../' 
    alias .5='cd ../../../../..'
fi
