#!/usr/bin/env fish

# set alias to show env diff
abbr -a envdiff 'env | sort | diff --suppress-common-lines $TMPDIR/env_$fish_pid - | grep --color=never -e ">" -e "<"'
