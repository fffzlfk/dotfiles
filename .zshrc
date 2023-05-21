setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
bindkey -e

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

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
SAVEHIST=10000  # Save most-recent 1000 lines
# HISTFILE=~/.zsh_history
HISTFILE=${ZDOTDIR:-$HOME}/.zhistory

### zinit init
# Plugin history-search-multi-word loaded with investigating.
zinit light zsh-users/zsh-history-substring-search

zinit light zsh-users/zsh-completions

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# zinit light marlonrichert/zsh-autocomplete
#zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zdharma-continuum/history-search-multi-word
# Load starship theme
zinit ice as"command" from"gh-r" atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
zinit light starship/starship
### zinit init end

export http_proxy=http://192.168.0.103:7890
export https_proxy=http://192.168.0.103:7890

export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/fffzlfk/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:/home/fffzlfk/.local/bin
export PATH=$PATH:/usr/local/lib/nodejs/node-v18.12.1-linux-x64/bin

export PATH=$PATH:/usr/local/cuda/bin

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias cat='bat -p'

alias vim=nvim
alias vi=nvim

# znbase build
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/fffzlfk/go/src/github.com/znbasedb/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/fffzlfk/go/src/github.com/kwbasedb/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/fffzlfk/go/src/github.com/znbasedb/build
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/fffzlfk/go/src/github.com/kwbasedb/build
export NODE_OPTIONS=--openssl-legacy-provider

bindkey -v

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
