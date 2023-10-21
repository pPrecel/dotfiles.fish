#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)

source $DOTFILES_ROOT/scripts/common.fish

function brew_check
	set -l file_path $argv[1]
	set -l cask $argv[2]

	set -l brew_list
	while read -la line
		set brew_list $brew_list $line
	end < $file_path

	for val in $brew_list
		if test -n "$cask"
			brew search --cask $val >/dev/null
				or abort $val
            info 'found' $val
		else
			brew search $val >/dev/null
				or abort $val
                info 'found' $val
		end
	end
end

function check_vscode
    cat $DOTFILES_ROOT/vscode/extensions | while read line
        code --install-extension "$line" >/dev/null
            and info_installation_complete "$line"
            or abort_installation "$line"
    end
end

make "Checking brew list..."
    and brew_check $DOTFILES_ROOT/scripts/brew_list
    and success "List is ok"

make "Checking brew cask list..."
    and brew_check $DOTFILES_ROOT/scripts/brew_list_cask "true"
    and success "Cask list is ok"

make "Checking vscode extensions..."
    and check_vscode
    and success "Vscode extensions are valid"
