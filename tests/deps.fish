#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)

source $DOTFILES_ROOT/lib/lib.fish

make "Checking brew list..."
    and run_with_prefix $DOTFILES_ROOT/tests/brew.fish $DOTFILES_ROOT/pre_modules/pkg_manager/brew
    and success "List is ok"

make "Checking brew cask list..."
    and run_with_prefix $DOTFILES_ROOT/tests/brew.fish $DOTFILES_ROOT/pre_modules/pkg_manager/brew_cask "true"
    and success "Cask list is ok"

make "Checking vscode extensions..."
    and run_with_prefix $DOTFILES_ROOT/tests/vscode.fish
    and success "Vscode extensions are valid"
