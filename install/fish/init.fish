#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
set STEP_PATH $DOTFILES_ROOT/install/fish
set FISH_CONFIG "$HOME/.config/fish"
source $DOTFILES_ROOT/lib/*

set -l plugins (cat $DOTFILES_ROOT/install/fish/fisher_list)
fisher install $plugins >/dev/null
    and info_installation_complete "fisher plugins"
    or abort "fisher plugins"

lnWithBackup $STEP_PATH/config.fish $FISH_CONFIG/config.fish
lnFishFolder $STEP_PATH/conf.d $FISH_CONFIG/conf.d
lnFishFolder $STEP_PATH/functions $FISH_CONFIG/functions
