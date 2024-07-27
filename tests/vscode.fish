#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)

source $DOTFILES_ROOT/lib/lib.fish

cat $DOTFILES_ROOT/modules/vscode/extensions | while read line
    make "Looking for $line"
    code --install-extension "$line" >/dev/null
        and info_installation_complete "$line"
        or abort_installation "$line"
end
