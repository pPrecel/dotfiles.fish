#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

copyWithBackup $argv[1]/fish/config.fish $argv[2]/config.fish
copyFishFolder $argv[1]/fish/conf.d $argv[2]/conf.d
copyFishFolder $argv[1]/fish/functions $argv[2]/functions
