#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
set STEP_PATH $DOTFILES_ROOT/modules/iterm2
source $DOTFILES_ROOT/lib/*

if test -f /Library/Fonts/"RobotoMonoNerdFont-Regular.ttf"
    info_installation_skipped "RobotoMonoNerdFont-Regular.ttf"
else
    curl -fLo /Library/Fonts/"RobotoMonoNerdFont-Regular.ttf" \
        https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/RobotoMonoNerdFont-Regular.ttf \
        >/dev/null
    info_installation_complete "RobotoMonoNerdFont-Regular.ttf"
end

if test -f ~/Library/"Application Support"/iTerm2/DynamicProfiles/natural-fish.json
    info_installation_skipped "natural-fish.json"
else
    lnWithBackup $STEP_PATH/natural-fish.json \
        ~/Library/"Application Support"/iTerm2/DynamicProfiles/natural-fish.json
    info_installation_complete "natural-fish.json"
end
