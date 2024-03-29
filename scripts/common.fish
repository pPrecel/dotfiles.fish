#!/usr/bin/env fish

function info_installation_complete
    info "Installation complete for '$argv'"
end

function info_installation_skipped
    info "Installation skipped for '$argv'"
end

function info
	echo [(set_color --bold blue)' .. '(set_color normal)] $argv
end

function ask
	echo [(set_color --bold yellow)' ?? '(set_color normal)] $argv
end

function make
    echo [(set_color --bold blue)'MAKE'(set_color normal)] $argv
end

function success
	echo [(set_color --bold green)'DONE'(set_color normal)] $argv
end

function abort
	echo [(set_color --bold red)ABRT(set_color normal)] $argv
	exit 1
end

function abort_installation
    abort "Installation aborted for '$argv'"
end

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
