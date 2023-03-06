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

export PATH=$PATH:"$HOME/.local/share/applications"

export ANDROID_HOME="$HOME/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME"/emulator"
export PATH=$PATH:$ANDROID_HOME"/tools"
export PATH=$PATH:$ANDROID_HOME"/build-tools"
export PATH=$PATH:$ANDROID_HOME"/tools/bin"
export PATH=$PATH:$ANDROID_HOME"/platform-tools"

export PATH=$PATH:"$HOME/.yarn/bin"
export PATH="$HOME/.poetry/bin:$PATH"

export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

source "/etc/profile.d/rvm.sh"

# export _JAVA_AWT_WM_NONREPARENTING=1
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
# export RUBY_GEMS="/home/paul/.gem/ruby/2.7.0/gems"
# export PATH=$PATH:"/home/paul/.gem/ruby/2.7.0/bin"
# export PATH=$PATH:"$HOME/.cargo/env"
# export GOPATH="$HOME/go"
# export PATH=$PATH:"$GOPATH/bin"

# Fix Home,End and Del keys
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[P" delete-char

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
