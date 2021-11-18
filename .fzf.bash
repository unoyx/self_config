# Setup fzf
# ---------
if [[ ! "$PATH" == */data/heshan/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/data/heshan/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/data/heshan/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/data/heshan/fzf/shell/key-bindings.bash"
