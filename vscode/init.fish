#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

if test -f /Library/Fonts/"DejaVuSansMNerdFont-Regular.ttf"
    info_installation_skipped "DejaVuSansMNerdFont-Regular.ttf"
else
    curl -fLo /Library/Fonts/"DejaVuSansMNerdFont-Regular.ttf" \
        https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/DejaVuSansMNerdFont-Regular.ttf \
        &>/dev/null
    info_installation_complete "font 'DejaVuSansMNerdFont-Regular.ttf'"
end

lnWithBackup "$argv[1]/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

cat $argv[1]/vscode/extensions | while read line
    code --install-extension "$line" >/dev/null
        and info_installation_complete "$line"
        or abort_installation "$line"
end
