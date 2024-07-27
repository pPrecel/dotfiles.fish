#!/usr/bin/env fish

function info_installation_complete
    success "Installation complete for $argv"
end

function info_installation_skipped
    skip "Installation skipped for $argv"
end

function info
	echo '[ .. ]' $argv &>/dev/stdout
end

function ask
	echo [(set_color --bold yellow)' ?? '(set_color normal)] $argv &>/dev/stdout
end

function make
    echo [(set_color --bold blue)'MAKE'(set_color normal)] $argv &>/dev/stdout
end

function success
	echo [(set_color --bold green)'DONE'(set_color normal)] $argv &>/dev/stdout
end

function skip
	echo [(set_color --bold yellow)'SKIP'(set_color normal)] $argv &>/dev/stdout
end

function abort
	echo [(set_color --bold red)'ABRT'(set_color normal)] $argv &>/dev/stderr
	exit 1
end

function abort_installation
    abort "Installation aborted for '$argv'" &>/dev/stdout
end