if [[ $- =~ "i" ]]; then
    if command -v tmux >/dev/null 2>&1; then
        [[ -z "$TMUX" ]] && exec tmux new-session -A -s main
    fi
fi
