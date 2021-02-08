#!/usr/bin/env fish
#
# bootstrap installs things.

set DOTFILES_ROOT (pwd -P)
set FISH_CONFIG "$HOME/.config/fish"

function info
	echo [(set_color --bold blue) ' .. ' (set_color normal)] $argv
end

function ask
	echo [(set_color --bold yellow) ' ?? ' (set_color normal)] $argv
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function abort
	echo [(set_color --bold red) ABRT (set_color normal)] $argv
	exit 1
end

function config_git
	if test -z (git config --global --get user.email)
		ask 'What is your github author email?'
		read user_email
		test -n $user_email
			or abort "empty author email"
	end
	if test -z (git config --global --get user.name)
		ask 'What is your github author name?'
		read user_name
		test -n $user_name
			or abort "empty author name"
	end
	git config --global user.name $user_name >/dev/null
		and git config --global user.email $user_email >/dev/null
		or abort 'failed to setup git user name and email'
end

curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher >/dev/null
	and success 'fisher'
	or abort 'fisher'

config_git 
	and success 'git'
	or abort 'git'

for init in */init.fish
	fish $init $DOTFILES_ROOT $FISH_CONFIG
		and success $init
		or abort $init
end
