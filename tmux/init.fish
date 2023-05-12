#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

if test -d ~/.tmux/plugins/tpm
    info_installation_skipped 'tpm'
else
    git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    info_installation_complete 'tpm'
end

if test -d ~/.tmux/plugins/tmux-natural
    info_installation_skipped 'tmux-natural'
else
    git clone -q https://github.com/pPrecel/tmux-natural ~/.tmux/plugins/tmux-natural
    info_installation_complete 'tmux-natural'
end

lnWithBackup $argv[1]/tmux/.tmux.conf $HOME/.tmux.conf