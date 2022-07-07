#!/usr/bin/env fish
#
# bootstrap installs things.

set DOTFILES_ROOT (pwd -P)
set FISH_CONFIG "$HOME/.config/fish"

source $DOTFILES_ROOT/scripts/common.fish

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

function install_fisher
	if type -q 'fisher'
		info_installation_skipped 'fisher'
	else
		curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher >/dev/null
		info_installation_complete 'fisher'
	end
end

function install_krew
	set -l temp_dir (mktemp -d)

	pushd $temp_dir
	set -l _OS (uname | tr '[:upper:]' '[:lower:]')
		and set -l _ARCH (uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')
		and set -l _KREW krew-$_OS"_"$_ARCH
		and curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/$_KREW.tar.gz"
		and tar zxvf $_KREW.tar.gz
		and ./$_KREW install krew
	popd
end

function brew_install
	set -l brew_list
	while read -la line
		set brew_list $brew_list $line
	end < $DOTFILES_ROOT/scripts/brew_list

	for val in $brew_list
		if brew ls --versions $val >/dev/null
			info_installation_skipped $val
		else
			brew install $val -q
				or abort_installation $val
			info_installation_complete $val
		end
	end
end

type -q fish
	and type -q brew
	and type -q git
	and type -q vim
	or abort "Instal 'fish', 'git', 'vim' and 'brew' first"

config_git 
	and success 'git'
	or abort 'git'

brew_install
	and success 'brew'
	or abort 'brew'

install_fisher
	and success 'fisher'
	or abort 'fisher'

install_krew
	and success 'krew'
	or abort 'krew'

for init in */init.fish
	fish $init $DOTFILES_ROOT $FISH_CONFIG
		and success $init
		or abort $init
end
