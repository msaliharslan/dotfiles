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

