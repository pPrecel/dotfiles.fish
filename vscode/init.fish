#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

if test -f /Library/Fonts/"DejaVu Sans Mono Nerd Font Complete.ttf"
    info_installation_skipped "font 'DejaVu Sans Mono Nerd Font Complete.ttf'"
else
    curl -fLo /Library/Fonts/"DejaVu Sans Mono Nerd Font Complete.ttf" \
        https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf \
        &>/dev/null
    info_installation_complete "font 'DejaVu Sans Mono Nerd Font Complete.ttf'"
end

copyWithBackup "$argv[1]/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

cat $argv[1]/vscode/extensions | while read line
    code --install-extension "$line" >/dev/null
        and info_installation_complete "$line"
        or abort_installation "$line"
end
