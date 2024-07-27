#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
source $DOTFILES_ROOT/lib/*

set -l file_name $argv[1]
set -l cask $argv[2]

function install
    set -l val $argv[1]

    if brew ls --versions $val >/dev/null
        run_with_prefix brew upgrade $val
    else if test -n "$cask"
        run_with_prefix brew install --cask $val
    else
        run_with_prefix brew install $val
    end
end

set -l brew_list
while read -la line
    set brew_list $brew_list $line
end < $DOTFILES_ROOT/pre_modules/pkg_manager/$file_name

for val in $brew_list
    make "Installing $val..."
    
    install $val
        or abort_installation $val

    info_installation_complete $val
end
