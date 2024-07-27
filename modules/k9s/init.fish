#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
set STEP_PATH $DOTFILES_ROOT/modules/k9s
set K9S_CONFIG "$HOME/.config/k9s"
source $DOTFILES_ROOT/lib/*

mkdir -p $K9S_CONFIG

lnWithBackup $STEP_PATH/skin.yml \
    $K9S_CONFIG/skin.yml

info_installation_complete "skin.yml"

lnWithBackup $STEP_PATH/config.yml \
    $K9S_CONFIG/config.yml

info_installation_complete "config.yml"

lnWithBackup $STEP_PATH/plugin.yml \
    $K9S_CONFIG/plugin.yml

info_installation_complete "plugin.yml"
