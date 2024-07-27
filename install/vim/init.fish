#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
set STEP_PATH $DOTFILES_ROOT/install/vim
source $DOTFILES_ROOT/lib/*

if test -f ~/.vim/autoload/plug.vim
    info_installation_skipped 'vim-plug'
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null
    info_installation_complete 'vim-plug'
end

lnWithBackup $STEP_PATH/.vimrc $HOME/.vimrc

mkdir -p $HOME/.config/nvim
lnWithBackup $STEP_PATH/init.vim $HOME/.config/nvim/init.vim
