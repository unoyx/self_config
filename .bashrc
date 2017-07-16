if [[ $- =~ "i" ]]; then
    if command -v tmux >/dev/null 2>&1; then
        [[ -z "$TMUX" ]] && exec tmux new-session -A -s main
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
fi
