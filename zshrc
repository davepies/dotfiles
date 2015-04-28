source ~/.antigen.zsh

# vi mode key timeout
export KEYTIMEOUT=1

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES

zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
# sindresorhus/pure

rupa/z

git
npm

EOBUNDLES

antigen theme blinks
antigen apply

# default bindings for zsh-users/zsh-history-substring-search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up

bindkey -M vicmd 'j' history-substring-search-down

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

alias c='clear'
alias glf='git log --pretty=fuller'
alias glfg='git log --pretty=fuller --graph'

alias mongod='mongod --config /usr/local/etc/mongod.conf'

# TODO
todo () {
  IFS_OLD="$IFS"
  IFS=$'\n'
  touch $(echo ~/Desktop/$@)
  IFS="$IFS_OLD"
}

# NODE
export NODE_ENV=development
export PATH="/usr/local/bin:$PATH"
