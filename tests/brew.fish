#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)

source $DOTFILES_ROOT/lib/lib.fish

set -l file_path $argv[1]
set -l cask $argv[2]

set -l brew_list
while read -la line
    set brew_list $brew_list $line
end < $file_path

for val in $brew_list
    if test -n "$cask"
        make "Looking for $val"
        brew search --cask $val >/dev/null
            or abort $val
        success Found $val
    else
        make "Looking for $val"
        brew search $val >/dev/null
            or abort $val
        success Found $val
    end
end
