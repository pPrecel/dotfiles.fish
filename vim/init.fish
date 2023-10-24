#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

if test -f ~/.vim/autoload/plug.vim
    info_installation_skipped 'vim-plug'
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null
    info_installation_complete 'vim-plug'
end

lnWithBackup $argv[1]/vim/.vimrc $HOME/.vimrc

mkdir -p $HOME/.config/nvim
lnWithBackup $argv[1]/vim/init.vim $HOME/.config/nvim/init.vim
