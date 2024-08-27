#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
source $DOTFILES_ROOT/lib/lib.fish

make 'Add apt multiverse repo'
    and sudo add-apt-repository multiverse --yes 1>/dev/null
    and success 'Add apt multiverse repo'
    or abort 'Add apt multiverse repo'

make 'Add apt universe repo'
    and sudo add-apt-repository universe --yes 1>/dev/null
    and success 'Add apt universe repo'
    or abort 'Add apt universe repo'

make 'Update apt'
    and sudo apt update --yes 1>/dev/null
    and success 'Update apt'
    or abort 'Update apt'
