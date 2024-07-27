#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
source $DOTFILES_ROOT/lib/*

if type -q 'fisher'
    info_installation_skipped 'fisher'
else
    curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher >/dev/null
    info_installation_complete 'fisher'
end
