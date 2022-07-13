#!/usr/bin/env fish

source $argv[1]/scripts/common.fish

set -l krew_list
while read -la line
    set krew_list $brew_list $line
end < $argv[1]/kubectl/krew_list

for val in $krew_list
    if ~/.krew/bin/kubectl-krew krew list | grep $val >/dev/null
        info_installation_skipped $val
    else
        ~/.krew/bin/kubectl-krew krew install $val 
            or abort_installation $val
        info_installation_complete $val
    end
end
