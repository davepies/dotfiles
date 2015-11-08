# z

  set -g Z_SCRIPT_PATH /usr/local/etc/profile.d/z.sh


# Path to Oh My Fish install.

  set -gx OMF_PATH /Users/davepies/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/davepies/.config/omf


# Load oh-my-fish configuration.

  source $OMF_PATH/init.fish

# Aliases

  alias c='clear'
  alias gst='git status'


# Want vi everywhere

  fish_vi_mode


# ENV Variables
  export EDITOR=vim
  export ANDROID_HOME=/usr/local/opt/android-sdk

# Functions

  function take
    mkdir -p -- $argv; cd $argv
  end

  function google
    set search_term ""
    for term in $argv
      set search_term "$search_term%20$term"
    end
    open http://google.com/search\?q=$search_term
  end

