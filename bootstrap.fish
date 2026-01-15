#!/usr/bin/env fish
#
# bootstrap installs things.

# set -gx STD_DEBUG /dev/stdout

set -gx DOTFILES_ROOT (pwd -P)
set -gx FISH_CONFIG "$HOME/.config/fish"

source $DOTFILES_ROOT/lib/*

if [ "$(uname -s)" = "Linux" ]
    make 'check prerequisites'
        and type -q fish
        and type -q apt
        and type -q git
        and type -q vim
        and type -q curl
        and success 'check prerequisites'
        or abort "Install 'fish', 'git', 'vim', 'curl', and 'apt' first"
else
    make 'check prerequisites'
        and type -q fish
        and type -q brew
        and type -q git
        and type -q vim
        and type -q curl
        and success 'check prerequisites'
        or abort "Install 'fish', 'git', 'vim', 'curl', and 'brew' first"
end

for init in pre_modules/*/init.fish
    set -l STEP_NAME $(basename $(dirname $init))
    make Configuring $STEP_NAME
        and run_with_prefix fish $init
        and success Configured $STEP_NAME
        or abort Aborted $STEP_NAME
end

for init in modules/*/init.fish
    set -l STEP_NAME $(basename $(dirname $init))
    make Configuring $STEP_NAME
        and run_with_prefix fish $init
        and success Configured $STEP_NAME
        or abort Aborted $STEP_NAME
end
