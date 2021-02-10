#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

if test -f /Library/Fonts/"Roboto Mono Nerd Font Complete.ttf"
    info_installation_skipped "for font 'Roboto Mono Nerd Font Complete.ttf'"
else
    curl -fLo /Library/Fonts/"Roboto Mono Nerd Font Complete.ttf" \
        https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf \
        &>/dev/null
    info_installation_complete "for font 'Roboto Mono Nerd Font Complete.ttf'"
end

if test -f ~/Library/"Application Support"/iTerm2/DynamicProfiles/natural-fish.json
    info_installation_skipped "for natural-fish.json"
else
    copyWithBackup $argv[1]/iterm2/natural-fish.json \
        ~/Library/"Application Support"/iTerm2/DynamicProfiles/natural-fish.json
    info_installation_complete "for natural-fish.json"
end
