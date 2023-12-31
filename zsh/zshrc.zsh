# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment Variables
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/mnt/c/Users/lucas/AppData/Local/Microsoft/WindowsApps"
export PATH="$PATH:/mnt/c/Users/lucas/AppData/Local/Programs/Microsoft VS Code/bin"
export PATH="$PATH:/mnt/c/Program Files/Docker/Docker/resources/bin"
export PATH="$PATH:/mnt/c/ProgramData/DockerDesktop/version-bin"
export PATH="$PATH:/mnt/c/WINDOWS"

# Theme and Plugins
ZSH_THEME="robbyrussell"
plugins=(aliases colored-man-pages gh vscode fast-syntax-highlighting git docker golang archlinux)

# auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

source $ZSH/oh-my-zsh.sh

# Rust zsh-alternativs install with yay
# yay -S exa fd procs sd dust ripgrep tokei hyperfine bottom tealdeer bandwhich grex

# Custom Aliases
alias zshrc="code .zshrc"
alias p10kz="code .p10k.zsh"
alias ls="exa --icons"  # Improved ls command with icons using 'exa'
alias cls="clear"       # Clear screen command
alias find="fd"         # Improved 'find' command using 'fd'
alias pd="procs"        # Display running processes with 'procs'
alias sed="sd"          # Improved 'sed' command using 'sd'
alias du="dust"         # Improved 'du' command using 'dust'
alias ssha="ssh-add ~/.ssh/id_ed25519"  # Add SSH key to agent
alias ghc="gh copilot"  # Shortcut for GitHub Copilot command

# Zinit Installation Check
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Zinit Initialization
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
 
# starship
# eval "$(starship init zsh)"

# ssh agent
eval "$(ssh-agent -s)"

. /opt/asdf-vm/asdf.sh

# bash_completion
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh