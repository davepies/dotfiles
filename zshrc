export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# cloud
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse osx)
plugins=(history-substring-search git web-search autojump brew node python compleat)

source $ZSH/oh-my-zsh.sh

alias tmux="tmux -2"

# Customize to your needs...
# NODE PATH
export NODE_PATH=/usr/local/lib/node:/usr/local/lib/jsctags

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/.local/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

. `brew --prefix`/etc/profile.d/z.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Aliases
alias c="clear"
alias node="node --harmony"

# Node Path
NODE_PATH=$NODE_PATH:/Users/davepies/.local/lib/node_modules

[[ -s /Users/davepies/.nvm/nvm.sh ]] && . /Users/davepies/.nvm/nvm.sh # This loads NVM

# TODO
todo () {
  IFS_OLD="$IFS"
  IFS=$'\n'
  touch $(echo ~/Desktop/$@)
  IFS="$IFS_OLD"
}

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
