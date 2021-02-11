#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

cat $argv[1]/vscode/extensions | while read line
    code --install-extension "$line" >/dev/null
        and info_installation_complete "for extension $line"
        or abort "for extension $line"
end
