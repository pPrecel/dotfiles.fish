#!/usr/bin/env fish

abbr -a g 'git'
abbr -a ga 'git add'
abbr -a gst 'git status'
abbr -a grh 'git reset'
abbr -a grhh 'git reset --hard'
abbr -a gc 'git commit'
abbr -a gco 'git checkout'
abbr -a gcom 'git checkout master'
abbr -a gp 'git push'
abbr -a gfa 'git fetch --all'

# improved review
abbr -a -- gr 'git pull --no-commit --no-rebase'

# diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
