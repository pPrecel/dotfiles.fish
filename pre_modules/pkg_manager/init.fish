#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
source $DOTFILES_ROOT/lib/lib.fish

if [ "$(uname -s)" = "Linux" ]
	fish $DOTFILES_ROOT/pre_modules/pkg_manager/apt.fish
else
	set BREW_INSTALL $DOTFILES_ROOT/pre_modules/pkg_manager/brew.fish

	# TODO: support linux
	make 'Update brew'
		and run_with_prefix brew update --auto-update
		and success 'Updated brew'
		or abort 'Updated brew'

	$BREW_INSTALL "brew"

	$BREW_INSTALL 'brew_cask' "true"

	$BREW_INSTALL 'brew_custom'
end
