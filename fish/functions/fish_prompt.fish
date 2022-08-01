#!/usr/bin/env fish

function fish_prompt
    # $status gets nuked as soon as something else is run
    set -g last_status $status

    test -n "$SSH_TTY"
        and __ssh_prompt
        or __common_prompt

    set_color normal
end

function __ssh_prompt
    echo -n (set_color (__status_color))"$USER"(set_color white)'@'(set_color yellow)(pwd)' '
end

function __common_prompt
    test "$USER" = 'root'
        and echo -n (set_color (__status_color))'[ # ] '
        or  echo -n (set_color (__status_color))(__status_symbol)' '
    echo -n (set_color normal)(__prompt_pwd)' '
end

function __status_color 
    test $last_status -eq 0
        and echo -n '78ab21'
        or echo -n 'dc3936'
end

function __status_symbol
    test $last_status -eq 0
        and echo -n '[･‿･]'
        or echo -n '[ಠ_ಠ]'
end

function __prompt_pwd --description "Print the current working directory, shortened to fit the prompt"
    if git rev-parse --git-dir &> /dev/null
        set -l rootpath (basename (git rev-parse --show-toplevel))
        echo -n (basename $rootpath)(__repo_path)' '(__prompt_git_info)
    else
        set -l realhome ~
        echo -n (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
    end
end

function __repo_path 
    set -l repopath (git rev-parse --show-prefix 2> /dev/null)
    test -n $repopath
        and set repopath "/$repopath"
    echo $repopath
end

function __prompt_git_info    
    set -l branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set -l git_status (git status --porcelain)

    set -l prompt_sufix "✓"
    test -n "$git_status" 
        and set prompt_sufix '✗'

    set -l prompt_suffix_color green
    test -n "$git_status"
        and set prompt_suffix_color yellow

    echo -n (set_color blue)$branch' '(set_color $prompt_suffix_color)$prompt_sufix
end
