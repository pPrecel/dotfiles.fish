#!/usr/bin/env fish

# disable greeting
set fish_greeting

set -gx GOPATH "$HOME/go"
set -gx KCPCONFIG "$HOME/.kcp/config-dev.yaml"
set -gx ISTIOCTL_PATH (which istioctl)

set -gx EDITOR (which vim)

set -gx XDG_CONFIG_HOME "$HOME/.config"

set -g fish_user_paths $fish_user_paths "$GOPATH/bin"
set -g fish_user_paths $fish_user_paths "$HOME/google-cloud-sdk/bin"
set -g fish_user_paths $fish_user_paths "$HOME/Library/Python/3.7/bin"
set -g fish_user_paths $fish_user_paths "/opt/metasploit-framework/bin"
set -g fish_user_paths $fish_user_paths "/usr/local/opt/tcl-tk/bin"
set -g fish_user_paths $fish_user_paths "/opt/homebrew/bin"
set -g fish_user_paths $fish_user_paths "$HOME/.rd/bin"
set -g fish_user_paths $fish_user_paths "$HOME/.krew/bin"
set -g fish_user_paths $fish_user_paths "$HOME/.local/bin/"

alias ls='lsd'
alias grep='rg'
alias find='fd'
alias du='ncdu'
alias vi='nvim'
alias vim='nvim'
alias man='tldr'
alias watch='viddy'
alias diff='colordiff'

set KP $GOPATH/src/github.com/kyma-project
set KI $GOPATH/src/github.com/kyma-incubator
set PP $GOPATH/src/github.com/pPrecel
set GH $GOPATH/src/github.com

# tcl-tk
set -gx LDFLAGS "-L/usr/local/opt/tcl-tk/lib"
set -gx CPPFLAGS "-I/usr/local/opt/tcl-tk/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/tcl-tk/lib/pkgconfig"

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
set -g fish_color_normal normal
set -g fish_color_command $green
set -g fish_color_quote $yellow
set -g fish_color_redirection $gray
set -g fish_color_end $purple
set -g fish_color_error $red
set -g fish_color_param $lite_gray
set -g fish_color_comment $yellow
set -g fish_color_match $blue
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_operator $blue
set -g fish_color_escape $cyan
set -g fish_color_autosuggestion $dark_gray

# Completion Pager Colors
set -g fish_pager_color_progress brwhite --background=cyan
set -g fish_pager_color_prefix white --bold --underline
set -g fish_pager_color_completion normal
set -g fish_pager_color_description $latte yellow

# Run the tmux and exit when it's session is ended
if status is-interactive 
and not set -q TMUX
    exec tmux
end

# set startup envs
env | sort > $TMPDIR/env_$fish_pid

exit
