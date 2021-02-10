#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

copyFishFolder $argv[1]/fish/conf.d $argv[2]/conf.d
