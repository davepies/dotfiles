source ~/dotfiles/zgen/zgen.zsh

# vi mode key timeout
export KEYTIMEOUT=1

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh vi-mode
    zgen oh-my-zsh httpie

zgen loadall <<EOPLUGINS
    zsh-users/zsh-completions src
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search
EOPLUGINS

    zgen oh-my-zsh themes/muse

    # save all to init script
    zgen save
fi

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

export TERM='xterm-256color'

alias c='clear'
alias glf='git log --pretty=fuller'
alias glfg='git log --pretty=fuller --graph'

alias mongod='mongod --config /usr/local/etc/mongod.conf'
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias tmux="TERM=screen-256color-bce tmux"

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

eval "$(~/.config/base16-shell/profile_helper.sh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
