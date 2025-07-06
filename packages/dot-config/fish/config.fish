#
# Bootstrap package manager
#
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c "fisher update"
end

#
# Setup keybindings
#

# <C-y> Accept completion with
bind \cy accept-autosuggestion

#
# Setup environment
#

# Setup starship prompt
if type -q starship
    starship init fish | source
    enable_transience
end

# Disable fish greeting
set fish_greeting

# Configure environment variables
fish_add_path $HOME/.local/bin
set -gx EDITOR nvim

#
# Setup tools
#

# yay
if type -q yay
    alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
end

# Git
if type -q git
    alias gs="git status"
    alias gb="git branch"
    if type -q fzf
        alias gl="git log --oneline | fzf"
    else
        alias gl="git log --format=oneline --decorate"
    end
    alias gcm="git commit -m"
    alias gd="git diff"
    function gdd --wraps='git difftool -d' --description 'alias gdd=git difftool -d'
        git difftool -d $argv &
    end
    # Aliases for git extensions (stefanpartheym/fish-git-extensions.git)
    alias gcob="gitext_checkout"
    alias gadd="gitext_add"
end

# Docker
if type -q docker-compose
    alias dc="docker-compose"
end

# Kubernetes
if type -q kubectl
    alias kc="kubectl"
end

# eza
if type -q eza
    alias ls="eza --icons"
    alias la="ls -la"
end

# fzf
if type -q fzf
    fzf --fish | source
end

# Zoxide
if type -q zoxide
    # Initialize zoxide.
    # HINT: Use flag `--no-cmd` to init without creating `z` and `zi` aliases.
    zoxide init fish | source
end

#
# Load custom config
#
if test -f ~/.config/fish/custom.fish
    source ~/.config/fish/custom.fish
end
