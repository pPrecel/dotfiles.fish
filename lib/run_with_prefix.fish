#!/usr/bin/env fish

function run_with_prefix
    if test $DOTFILES_STREAM
        $argv &>$DOTFILES_STREAM_2
    else
        # primary stream (stdout/stderr)
        set -x DOTFILES_STREAM (mktemp -u)
        touch "$DOTFILES_STREAM"

        # double prefixed stream
        set -x DOTFILES_STREAM_2 (mktemp -u)
        touch "$DOTFILES_STREAM_2"
    
        tail -f $DOTFILES_STREAM | sed 's/^/    /' &
        tail -f $DOTFILES_STREAM_2 | sed 's/^/        /' &
        $argv &>$DOTFILES_STREAM
    
        kill -SIGKILL %2 %1
        rm -f $DOTFILES_STREAM &>/dev/null
    end
end
