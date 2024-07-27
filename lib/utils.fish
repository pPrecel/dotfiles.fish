#!/usr/bin/env fish

function lnFishFolder
    set from $argv[1]
    set to $argv[2]

    cd $from

    for file in *.fish
        lnWithBackup $from/$file $to/$file
    end
end

function lnWithBackup
    set from $argv[1]
    set to $argv[2]

    # backup
    if test -f $to
        cp $to $from.backup
        info "Backup complete '$to.backup'"
    end

    ln -f $from $to
    info "Copy complete to '$to'"
end
