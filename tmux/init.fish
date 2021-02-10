#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

if test -d ~/.tmux/plugins/tpm
    info_installation_skipped 'tpm'
else
    git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    info_installation_complete 'tpm'
end

copyWithBackup $argv[1]/tmux/.tmux.conf $HOME/.tmux.conf