# Created by newuser for 5.8

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

WORDCHARS=${WORDCHARS//\/[&.;]}

# exports
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# History config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set options
setopt autocd
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt nocheckjobs
setopt histignorealldups
setopt COMPLETE_ALIASES

unsetopt nomatch

# Keybindings
bindkey -e
:
# Aliases
alias cp='cp -i'
alias df='df -h'
alias free='free -m'
alias ls='ls --color=auto'
alias lsa='ls -a'
alias ..='cd ..'
alias ~='cd ~'
alias gitu='git add . && git commit && git push'

# Powerlevel10k config
export _THEME=~/repos/dotdotdots/submodules/powerlevel10k/powerlevel10k.zsh-theme
[[ -f $_THEME ]] && . $_THEME

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Fix Home,End and Del keys
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[P" delete-char

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
