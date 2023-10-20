HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep nomatch
unsetopt extendedglob notify
bindkey -v

autoload -Uz compinit
compinit
zstyle :compinstall filename '/home/jaardim/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export EDITOR='nvim'
#export PAGER='nvim'
export TERMINAL='alacritty'
export BROWSER='brave'
#export PATH="$HOME/.config/emacs/bin/:$HOME/downloads/zig/zig-linux-x86_64-0.12.0-dev.286+b0d9bb0bb:$HOME/downloads/zig/zig-linux-x86_64-0.12.0-dev.286+b0d9bb0bb/zls/zig-out/bin:$PATH"

PROMPT=' %F{blue}%B%~%b%f 󰁔 '

alias update='sudo pacman -Syu'
alias nv='nvim'
alias v='nvim .'
alias z='zathura'
alias l='ls -a'
alias ls='ls --color=auto'
alias c='cd ..'
#alias find='sudo find / -iname'
alias gits='git status'
alias gitc='git commit -m'
alias gitl='git log --oneline --all --graph'
alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias pacc='cd; source python-virtual-env/python-env/bin/activate'
alias pio='/home/jaardim/.platformio/penv/bin/platformio'
alias gcc='gcc -Wextra -Wall -Werror'

wmname compiz #for java apps run on bspwm

neofetch --ascii_colors 6 4 8
