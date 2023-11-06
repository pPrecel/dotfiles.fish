#!/usr/bin/env fish

function envdiff --description "Show session env diff"
    env | sort | \
        diff --suppress-common-lines $TMPDIR/env_$fish_pid - | \
        grep --color=never -e ">" -e "<"
end
