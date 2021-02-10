#!/usr/bin/env fish

# disable greeting
set fish_greeting

set GOPATH ~/go

set PATH $PATH $GOPATH/bin
set PATH $PATH ~/google-cloud-sdk/bin
set PATH $PATH ~/Library/Python/3.7/bin
set PATH $PATH /opt/metasploit-framework/bin

alias ls='lsd'

set KP $GOPATH/src/github.com/kyma-project
set KI $GOPATH/src/github.com/kyma-incubator
set PP $GOPATH/src/github.com/pPrecel
