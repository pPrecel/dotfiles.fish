#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
source $DOTFILES_ROOT/lib/*

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

