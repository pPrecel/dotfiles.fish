#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

set -l plugins (cat $argv[1]/fish/fisher_list)
fisher install $plugins >/dev/null
    and info_installation_complete "fisher plugins"
    or abort "fisher plugins"

copyWithBackup $argv[1]/fish/config.fish $argv[2]/config.fish
copyFishFolder $argv[1]/fish/conf.d $argv[2]/conf.d
copyFishFolder $argv[1]/fish/functions $argv[2]/functions
