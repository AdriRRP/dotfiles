# danirod's .zshrc file
# These settings power my terminal.

# Oh my ZSH configuration
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git brew bundler osx rails ruby rvm)
source $ZSH/oh-my-zsh.sh

# ENV
# Cuda SDK lib
if [ -d "/usr/local/cuda-8.0/lib64" ]; then export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64; fi

# Enable X11 and gpg on macOS -- TODO: Should detect platform first?
#if [ -d /opt/X11 ]; then export PATH="$PATH:/opt/X11/bin"; fi
#if [ -d /usr/local/MacGPG2 ]; then export PATH="$PATH:/usr/local/MacGPG2"; fi

export LANG=es_ES.UTF-8
export EDITOR=vim

# Some applications like to set up their autostart scripts.
#[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
#[ -f $NVM_HOME/nvm.sh ] && source $NVM_HOME/nvm.sh
