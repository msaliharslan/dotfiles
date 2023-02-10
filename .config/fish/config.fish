if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable greeting message
set -g fish_greeting

# Starhip prompt
starship init fish | source

# Aliases
alias vim='nvim'
alias ls='ls -la --color=auto' 

set EDITOR "nvim"
set VISUAL "nvim"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/salih/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

