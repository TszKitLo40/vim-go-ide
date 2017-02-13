#!/bin/bash

is_installed() {
    [[ $(command -v $1 2>/dev/null) ]]
}

is_lua_enabled() {
    [[ $($1 --version | grep '+lua') ]]
}

read -r -d '' LUA_WARNING <<- EOM
======================================================================
WARNING: The installed version of Vim does not support the Lua
         interpreter, which is required by the vim neocomplete
         package. Please install a version of Vim that includes this
         support, e.g.:
            vim-gnome  (includes GUI)
            vim-nox    (does not include GUI)
         Note: You can check for Lua support with:
            vim --version | grep +lua
======================================================================
EOM

read -r -d '' VIM_WARNING <<- EOM
======================================================================
WARNING: Vim has not been installed on this host. Please install a
         version of Vim that includes support for the Lua
         interpreter (required by the vim neocomplete package), e.g.:
            vim-gnome  (includes GUI)
            vim-nox    (does not include GUI)
======================================================================
EOM

# Check whether current value of vim supports Lua language
# (required by vim neocomplete).
check_vim_lua() {
    if is_installed vim; then
        if ! is_lua_enabled vim; then
            echo "$LUA_WARNING"
        fi
    else
        echo "$VIM_WARNING"
    fi
}

is_exuberant_version() {
    [[ $($1 --version | grep 'Exuberant') ]]
}

read -r -d '' CTAGS_WARNING <<- EOM
===============================================================================
WARNING: The Exuberant version of Ctags is not installed on this host.
         This version is required by the vim tagbar package. It is
         typically installed with something similar to the following:

   cd ~/Downloads
   wget https://sourceforge.net/projects/ctags/files/ctags/5.8/ctags-5.8.tar.gz
   tar -xzf ctags-5.8.tar.gz
   cd ctags-5.8
   ./configure
   make
   sudo make install

===============================================================================
EOM

# Check whether exuberant Ctags is installed (required by vim tagbar).
check_exuberant_ctags() {
    if ! is_installed ctags || ! is_exuberant_version ctags; then
        echo "$CTAGS_WARNING"
    fi
}

# Back up .vimrc if present
backup_dot_vimrc() {
    if [ -f ~/.vimrc ]; then
        cp --backup=numbered ~/.vimrc ~/.vimrc.bak
    fi
}

check_vim_lua
check_exuberant_ctags
backup_dot_vimrc
cd ~/.vim_runtime
sh install_awesome_vimrc.sh

