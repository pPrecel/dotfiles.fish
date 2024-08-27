#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)
source $DOTFILES_ROOT/lib/*

set -l temp_dir (mktemp -d)

pushd $temp_dir
    set -l _OS (uname | tr '[:upper:]' '[:lower:]')
    and set -l _ARCH (uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')
    and set -l _KREW krew-$_OS"_"$_ARCH
    and curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/$_KREW.tar.gz"
    and tar zxvf $_KREW.tar.gz >/dev/null
    and ./$_KREW install krew >/dev/null
popd
