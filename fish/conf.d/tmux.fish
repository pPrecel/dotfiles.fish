#!/usr/bin/env fish

if not set -q TMUX
    set -g TMUX /opt/homebrew/bin/tmux new-session -d -s base
    eval $TMUX
    /opt/homebrew/bin/tmux attach-session -d -t base
end
