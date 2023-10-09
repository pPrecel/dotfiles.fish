#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

mkdir -p "$HOME/.config/k9s"

lnWithBackup $argv[1]/k9s/skin.yml \
    $HOME/.config/k9s/skin.yml

info_installation_complete "skin.yml"

lnWithBackup $argv[1]/k9s/config.yml \
    $HOME/.config/k9s/config.yml

info_installation_complete "config.yml"
