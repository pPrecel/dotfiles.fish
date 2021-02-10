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

# Color Palette
set -l red f2777a
set -l yellow ffcc66
set -l green 99cc99
set -l purple cc99cc
set -l blue 6699cc
set -l cyan 66cccc
set -l gray d3d0c8
set -l lite_gray d3d0c8
set -l dark_gray 747369
set -l latte B3A06D

# Syntax Highlighting Colors
set -g fish_color_normal 'normal'
set -g fish_color_command $green
set -g fish_color_quote $yellow
set -g fish_color_redirection $gray
set -g fish_color_end $purple
set -g fish_color_error $red
set -g fish_color_param $lite_gray
set -g fish_color_comment $yellow
set -g fish_color_match $blue
set -g fish_color_selection 'white --bold --background=brblack'
set -g fish_color_search_match 'bryellow --background=brblack'
set -g fish_color_operator $blue
set -g fish_color_escape $cyan
set -g fish_color_autosuggestion $dark_gray

# Completion Pager Colors
set -g fish_pager_color_progress 'brwhite --background=cyan'
set -g fish_pager_color_prefix 'white --bold --underline'
set -g fish_pager_color_completion 'normal'
set -g fish_pager_color_description "$latte yellow"
